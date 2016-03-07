every 1.month, at: "end of the month at 2am" do
  rake "user:send_statistic_when_end_of_month"
end
