class Setup < Thor
  desc "testing", "pulling power rankings"

  def testing
    require './config/environment'
    
    Sport.find(:all).each do |ssss|
      puts ssss.sport
    end

  end
end