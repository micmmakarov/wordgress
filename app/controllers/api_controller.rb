

class ApiController < ApplicationController

  def word

    json=params[:data]

    puts "#######"
    puts "#######"
    puts "#######"
    puts "#######"
    puts "####### Request"
    puts "#######"
    puts "#######"
    puts "#######"
    puts "#######"
    puts "####### Query"

    @word = remember!(json)

    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

    @word = Word.find(@word.id)
    render "home/remember.js"

    #data1.primaries[0].entries

  end

  def remember!(json)
    puts json.class
    w = json[:query].downcase
    w.strip!
    puts w
    words = Word.where(:text => w)
    puts "Where?"
    if words.length==0

      @word = Word.new
      @word.text = w
      @word.save!

      puts @word.id
      puts "###"
      puts "###"
      puts "###"
      # puts json[:primaries]['0'][:entries].length
      puts "Length: " + json[:primaries]['0'][:entries].length.to_s
      puts "###"

      json[:primaries]['0'][:entries].each do |e|
        #puts "DEF"
        #puts e[0]
        puts "###"
        def1 = e[1][:terms]['0'][:text]#.class #['0'][:terms]['0'][:text]
        puts "Definition " + e[0].to_s + " : " + def1.to_s
        def2 = @word.definitions.create!(:text => def1, :rating => 0)
                                     #data1.primaries[0].entries[i].terms[0].text
        if e[1][:entries]
          example1 = e[1][:entries]['0'][:terms]['0'][:text]
        end
        puts "Example " + e[0].to_s + " : " + def1.to_s
        def2.examples.create!(:text => example1)

      end
    else
      @word=words[0]
      puts "########################### Already know the word"
      puts @word.inspect
    end
     return @word
  end

end
