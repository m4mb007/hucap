# app/helpers/application_helper.rb

module ApplicationHelper

    def ordinalize_day(day)
      if day.is_a?(Integer)
        if (11..13).include?(day % 100)
          "#{day}th"
        else
          case day % 10
          when 1 then "#{day}st"
          when 2 then "#{day}nd"
          when 3 then "#{day}rd"
          else "#{day}th"
          end
        end
      else
        day.strftime("#{ordinalize_day(day.day)} of %B %Y") if day.respond_to?(:day)
      end
    end
  end

  
 def from_to(days)
  if days < 1
    "on #{ordinalize_day(@participant.created_at)}"
  else
    "from #{ordinalize_day(@participant.created_at)} to #{ordinalize_day(@participant.created_at)}"
  end
 end

  def custom_text_helper(p,day = 1)
    "has successfully completed #{p.course_category.name} held #{from_to(day)} at Plomogroup Training Centre, Pulau Indah. "
  end
  
  def custom_format_ics_no(ics_no)
    # Customize the formatting logic here
    ics_no.insert(6, '-').insert(9, '-')
  end

  def serial_number_helper(p)
    "Serial No: PSB SSA/2024/#{p}"
  end
