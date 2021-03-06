class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

  @character_count_with_spaces = @text.length
  text_wo_spaces= @text.gsub(" ","")
  text_wo_linefeed= text_wo_spaces.gsub("/n","")
  text_wo_cr= text_wo_linefeed.gsub("\r","")
  text_wo_tabs= text_wo_cr.gsub("\t","")
  @character_count_without_spaces = text_wo_tabs.length
  @word_count = @text.split.count
  @occurrences = @text.downcase.gsub(/[^a-z0-9\s]/i,"").split.count(@special_word.downcase)


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

periods= (@years*-12)
apr_percent= ((@apr/100)/12)
numerator= apr_percent
denominator_paren= (apr_percent+1)
denominator= 1-(denominator_paren**periods)

    @monthly_payment =(numerator/denominator)*@principal

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = (@ending - @starting)
    @minutes = ((@ending - @starting)/60)
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @sorted_numbers.first

    @maximum = @sorted_numbers.last

    @range = @maximum - @minimum

    if @count.odd?
      @median=@sorted_numbers[((@count+1)/2)],
    else
      @median=((@sorted_numbers[(@count)/2])+(@sorted_numbers[(@count+2)/2]))/2
    end

    @sum = @numbers.sum

    @mean = @sum/@count

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
