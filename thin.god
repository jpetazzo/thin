# Start with "god -c thin.god"

  God.watch do |w|
    w.name = "thin"
    w.dir = "/home/dotcloud/current"
    w.interval = 30.seconds # default      
    w.start = "thin start -p 8080"
    w.log = "/home/dotcloud/thin.log"

    w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end

end

