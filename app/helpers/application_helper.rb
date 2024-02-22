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
  