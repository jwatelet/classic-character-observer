class WarcraftLogsService
  BASE_URL = 'https://classic.warcraftlogs.com:443/v1'.freeze
  SERVER_NAME = 'Sulfuron'.freeze
  REGION = 'EU'.freeze

  def self.classes
    response = RestClient.get("#{BASE_URL}/classes", { params: { api_key: ENV['WARCRAFT_LOGS_CLIENT_KEY'] } })
    JSON.parse(response.body)
  end

  def self.parses(character_name)
    response = RestClient.get("#{BASE_URL}/parses/character/#{CGI.escape(character_name)}/#{SERVER_NAME}/#{REGION}", { params: { api_key: ENV['WARCRAFT_LOGS_CLIENT_KEY'], includeCombatantInfo: true } })
    JSON.parse(response.body)
  end

  def self.rankings(character_name)
    response = RestClient.get("#{BASE_URL}/rankings/character/#{CGI.escape(character_name)}/#{SERVER_NAME}/#{REGION}", { params: { api_key: ENV['WARCRAFT_LOGS_CLIENT_KEY'], includeCombatantInfo: true, timeframe: 'today' } })
    JSON.parse(response.body)
  end

  def self.reports(guild_name)
    response = RestClient.get("#{BASE_URL}/reports/guild/#{CGI.escape(guild_name)}/#{SERVER_NAME}/#{REGION}", { params: { api_key: ENV['WARCRAFT_LOGS_CLIENT_KEY'] } })
    JSON.parse(response.body).take(10)
  end
end
