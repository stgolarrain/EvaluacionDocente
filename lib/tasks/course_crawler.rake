desc "Import courses from web crawler"
task :import_courses => :environment do
	require 'capybara/dsl'
	require 'capybara-webkit'
	require 'nokogiri'
	
	url_regex = '^(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/ix'
	root = 'http://catalogo.uc.cl'

	include Capybara::DSL
	Capybara.current_driver = :webkit
	Capybara.app_host = root
	page.visit('/')
	
	course_count = 0

	doc = Nokogiri::HTML(page.html)
	doc.search('a.conenlace').each do |au|
		au_url = au['href']
		au_name = au.content
		puts "\n== Parsing Academic Unit #{au.content} - #{au_url}"
		
		page.visit(au_url)
		page.execute_script("$('#tablacursos').tablesorterPager({container: $('#pager'), positionFixed: false, size: 10000});")
		course_doc = Nokogiri::HTML(page.html)

		course_doc.search('tbody')[2].search('tr').each do |row|
			data = row.search('td')
			puts "\nAcademic Unit: #{data[0].content}"
			puts "Acronym: #{data[1].content}"
			puts "Name: #{data[2].content}"
			puts "Teacher: #{data[3].content}"
			puts "Semester: #{data[4].content}"
			puts "Status: #{data[5].content}"
			puts "Requirements: #{data[6].child['href']}"
			puts "Description: #{data[7].child['href']}"
			puts "Syllabus: #{data[8].child['href']}"
			puts "Web Page: #{data[9].child['href']}"

			academic_unit = AcademicUnit.where(:name => data[0].content).first_or_create
			teacher = Teacher.where(:name => data[3].content).first_or_create
			
			year = data[4].content.split('-')[0]
			semester = "#{data[4].content.split('-')[1].to_i % 2}"
			semester = semester == 0 ? 2 : 1
			semester = Semester.where(:name => "#{year}-#{semester}").first_or_create

			course = Course.new( :acronym => data[1].content, :name => data[2].content, \
						:status => data[5].content, :requirement => data[6].child['href'], \
						:description => data[7].child['href'], :syllabus => data[8].child['href'], \
						:web_page => data[9].child['href'])
			course.teacher = teacher
			course.academic_unit = academic_unit
			course.semester = semester
			if not course.save
				errors << course.errors.messages
				acronymus_errors << data[1].content
			end
			course_count = course_count + 1
		end
	end
	puts "\n== Number courses processed: #{course_count}"

end