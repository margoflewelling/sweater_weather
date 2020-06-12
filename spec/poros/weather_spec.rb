require 'rails_helper'

 describe Weather do
   before(:each) do
    @hash={:lat=>39.74,
         :lon=>-104.99,
         :timezone=>"America/Denver",
         :timezone_offset=>-21600,
         :current=>
          {:dt=>1591467936,
           :sunrise=>1591443141,
           :sunset=>1591496726,
           :temp=>73.71,
           :feels_like=>67.95,
           :pressure=>1008,
           :humidity=>32,
           :dew_point=>42.04,
           :uvi=>11.67,
           :clouds=>100,
           :wind_speed=>7,
           :wind_deg=>183,
           :wind_gust=>20,
           :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
         :hourly=>
          [{:dt=>1591466400,
            :temp=>73.71,
            :feels_like=>54.39,
            :pressure=>1008,
            :humidity=>32,
            :dew_point=>42.04,
            :clouds=>100,
            :wind_speed=>31.07,
            :wind_deg=>181,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591470000,
            :temp=>77.29,
            :feels_like=>58.59,
            :pressure=>1007,
            :humidity=>30,
            :dew_point=>43.48,
            :clouds=>100,
            :wind_speed=>30.51,
            :wind_deg=>183,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591473600,
            :temp=>81,
            :feels_like=>69.39,
            :pressure=>1004,
            :humidity=>29,
            :dew_point=>45.79,
            :clouds=>100,
            :wind_speed=>18.84,
            :wind_deg=>178,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591477200,
            :temp=>85.32,
            :feels_like=>71.33,
            :pressure=>1003,
            :humidity=>24,
            :dew_point=>44.47,
            :clouds=>100,
            :wind_speed=>22.5,
            :wind_deg=>198,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591480800,
            :temp=>81.95,
            :feels_like=>69.31,
            :pressure=>1002,
            :humidity=>25,
            :dew_point=>42.71,
            :clouds=>100,
            :wind_speed=>19.44,
            :wind_deg=>199,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591484400,
            :temp=>86.77,
            :feels_like=>70.21,
            :pressure=>1002,
            :humidity=>16,
            :dew_point=>36.64,
            :clouds=>96,
            :wind_speed=>23.94,
            :wind_deg=>201,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]},
           {:dt=>1591488000,
            :temp=>87.44,
            :feels_like=>73.22,
            :pressure=>1002,
            :humidity=>13,
            :dew_point=>30.74,
            :clouds=>80,
            :wind_speed=>18.54,
            :wind_deg=>214,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]},
           {:dt=>1591491600,
            :temp=>85.35,
            :feels_like=>70.02,
            :pressure=>1002,
            :humidity=>13,
            :dew_point=>23.31,
            :clouds=>0,
            :wind_speed=>20.13,
            :wind_deg=>225,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591495200,
            :temp=>82.18,
            :feels_like=>69.93,
            :pressure=>1003,
            :humidity=>14,
            :dew_point=>22.1,
            :clouds=>0,
            :wind_speed=>14.52,
            :wind_deg=>225,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591498800,
            :temp=>78.8,
            :feels_like=>70.77,
            :pressure=>1004,
            :humidity=>16,
            :dew_point=>25.09,
            :clouds=>0,
            :wind_speed=>7.14,
            :wind_deg=>204,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591502400,
            :temp=>76.06,
            :feels_like=>67.75,
            :pressure=>1005,
            :humidity=>19,
            :dew_point=>30.47,
            :clouds=>0,
            :wind_speed=>8.12,
            :wind_deg=>175,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591506000,
            :temp=>73.9,
            :feels_like=>67.06,
            :pressure=>1006,
            :humidity=>21,
            :dew_point=>30.43,
            :clouds=>0,
            :wind_speed=>5.66,
            :wind_deg=>180,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591509600,
            :temp=>72.03,
            :feels_like=>64.65,
            :pressure=>1006,
            :humidity=>21,
            :dew_point=>28.31,
            :clouds=>0,
            :wind_speed=>6.24,
            :wind_deg=>169,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591513200,
            :temp=>69.64,
            :feels_like=>60.33,
            :pressure=>1005,
            :humidity=>23,
            :dew_point=>26.58,
            :clouds=>0,
            :wind_speed=>9.71,
            :wind_deg=>177,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591516800,
            :temp=>68.43,
            :feels_like=>58.89,
            :pressure=>1005,
            :humidity=>24,
            :dew_point=>25.27,
            :clouds=>0,
            :wind_speed=>10.16,
            :wind_deg=>188,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591520400,
            :temp=>67.41,
            :feels_like=>58.66,
            :pressure=>1005,
            :humidity=>24,
            :dew_point=>25.07,
            :clouds=>0,
            :wind_speed=>8.52,
            :wind_deg=>203,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591524000,
            :temp=>66.18,
            :feels_like=>57.74,
            :pressure=>1004,
            :humidity=>25,
            :dew_point=>25.23,
            :clouds=>0,
            :wind_speed=>7.99,
            :wind_deg=>206,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591527600,
            :temp=>65.46,
            :feels_like=>57.65,
            :pressure=>1005,
            :humidity=>26,
            :dew_point=>24.87,
            :clouds=>0,
            :wind_speed=>6.93,
            :wind_deg=>208,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591531200,
            :temp=>64.85,
            :feels_like=>58.01,
            :pressure=>1005,
            :humidity=>27,
            :dew_point=>24.87,
            :clouds=>0,
            :wind_speed=>5.32,
            :wind_deg=>211,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591534800,
            :temp=>66.29,
            :feels_like=>60.39,
            :pressure=>1005,
            :humidity=>25,
            :dew_point=>25.29,
            :clouds=>0,
            :wind_speed=>3.49,
            :wind_deg=>221,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591538400,
            :temp=>68.97,
            :feels_like=>63.66,
            :pressure=>1004,
            :humidity=>23,
            :dew_point=>25.63,
            :clouds=>0,
            :wind_speed=>2.51,
            :wind_deg=>219,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591542000,
            :temp=>72.19,
            :feels_like=>67.23,
            :pressure=>1003,
            :humidity=>21,
            :dew_point=>25.79,
            :clouds=>0,
            :wind_speed=>1.99,
            :wind_deg=>209,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591545600,
            :temp=>75.69,
            :feels_like=>70.7,
            :pressure=>1002,
            :humidity=>18,
            :dew_point=>25.72,
            :clouds=>0,
            :wind_speed=>1.81,
            :wind_deg=>254,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591549200,
            :temp=>79.56,
            :feels_like=>74.39,
            :pressure=>1001,
            :humidity=>16,
            :dew_point=>26.01,
            :clouds=>0,
            :wind_speed=>2.17,
            :wind_deg=>228,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591552800,
            :temp=>83.1,
            :feels_like=>75.15,
            :pressure=>1001,
            :humidity=>14,
            :dew_point=>26.71,
            :clouds=>0,
            :wind_speed=>7.02,
            :wind_deg=>220,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591556400,
            :temp=>86.76,
            :feels_like=>74.5,
            :pressure=>1000,
            :humidity=>13,
            :dew_point=>27.07,
            :clouds=>0,
            :wind_speed=>14.92,
            :wind_deg=>200,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591560000,
            :temp=>88.97,
            :feels_like=>74.05,
            :pressure=>998,
            :humidity=>12,
            :dew_point=>27.81,
            :clouds=>37,
            :wind_speed=>19.57,
            :wind_deg=>197,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]},
           {:dt=>1591563600,
            :temp=>89.55,
            :feels_like=>72.97,
            :pressure=>997,
            :humidity=>11,
            :dew_point=>25.05,
            :clouds=>56,
            :wind_speed=>22.12,
            :wind_deg=>214,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]},
           {:dt=>1591567200,
            :temp=>89.35,
            :feels_like=>71.89,
            :pressure=>997,
            :humidity=>11,
            :dew_point=>24.33,
            :clouds=>41,
            :wind_speed=>23.67,
            :wind_deg=>209,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]},
           {:dt=>1591570800,
            :temp=>88.68,
            :feels_like=>72.07,
            :pressure=>996,
            :humidity=>12,
            :dew_point=>24.15,
            :clouds=>34,
            :wind_speed=>22.53,
            :wind_deg=>214,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]},
           {:dt=>1591574400,
            :temp=>87.4,
            :feels_like=>71.37,
            :pressure=>996,
            :humidity=>13,
            :dew_point=>26.33,
            :clouds=>28,
            :wind_speed=>21.77,
            :wind_deg=>218,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]},
           {:dt=>1591578000,
            :temp=>84.42,
            :feels_like=>69.66,
            :pressure=>998,
            :humidity=>14,
            :dew_point=>26.44,
            :clouds=>0,
            :wind_speed=>19.35,
            :wind_deg=>223,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591581600,
            :temp=>81.77,
            :feels_like=>67.77,
            :pressure=>999,
            :humidity=>15,
            :dew_point=>27.1,
            :clouds=>0,
            :wind_speed=>17.92,
            :wind_deg=>226,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591585200,
            :temp=>79.2,
            :feels_like=>66.51,
            :pressure=>1001,
            :humidity=>17,
            :dew_point=>27.93,
            :clouds=>0,
            :wind_speed=>15.84,
            :wind_deg=>222,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591588800,
            :temp=>77,
            :feels_like=>65.19,
            :pressure=>1002,
            :humidity=>18,
            :dew_point=>26.11,
            :clouds=>0,
            :wind_speed=>14.18,
            :wind_deg=>233,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591592400,
            :temp=>74.91,
            :feels_like=>63.88,
            :pressure=>1004,
            :humidity=>18,
            :dew_point=>23.25,
            :clouds=>0,
            :wind_speed=>12.41,
            :wind_deg=>228,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591596000,
            :temp=>73.33,
            :feels_like=>63.01,
            :pressure=>1005,
            :humidity=>19,
            :dew_point=>22.66,
            :clouds=>0,
            :wind_speed=>11.14,
            :wind_deg=>224,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591599600,
            :temp=>71.8,
            :feels_like=>60.85,
            :pressure=>1005,
            :humidity=>19,
            :dew_point=>17.8,
            :clouds=>0,
            :wind_speed=>11.97,
            :wind_deg=>217,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591603200,
            :temp=>70.39,
            :feels_like=>61.27,
            :pressure=>1007,
            :humidity=>19,
            :dew_point=>13.57,
            :clouds=>0,
            :wind_speed=>8.5,
            :wind_deg=>220,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591606800,
            :temp=>68.74,
            :feels_like=>62.8,
            :pressure=>1008,
            :humidity=>21,
            :dew_point=>14.81,
            :clouds=>0,
            :wind_speed=>3.06,
            :wind_deg=>163,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591610400,
            :temp=>60.22,
            :feels_like=>49.84,
            :pressure=>1009,
            :humidity=>33,
            :dew_point=>30.11,
            :clouds=>0,
            :wind_speed=>11.83,
            :wind_deg=>45,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591614000,
            :temp=>56.77,
            :feels_like=>48.87,
            :pressure=>1009,
            :humidity=>46,
            :dew_point=>36.66,
            :clouds=>0,
            :wind_speed=>8.86,
            :wind_deg=>46,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
           {:dt=>1591617600,
            :temp=>55.42,
            :feels_like=>49.5,
            :pressure=>1010,
            :humidity=>50,
            :dew_point=>37.27,
            :clouds=>0,
            :wind_speed=>5.61,
            :wind_deg=>53,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591621200,
            :temp=>56.55,
            :feels_like=>50.67,
            :pressure=>1010,
            :humidity=>48,
            :dew_point=>37.54,
            :clouds=>0,
            :wind_speed=>5.55,
            :wind_deg=>90,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591624800,
            :temp=>58.42,
            :feels_like=>52.43,
            :pressure=>1010,
            :humidity=>46,
            :dew_point=>37.76,
            :clouds=>0,
            :wind_speed=>5.95,
            :wind_deg=>119,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591628400,
            :temp=>61.3,
            :feels_like=>54.39,
            :pressure=>1009,
            :humidity=>40,
            :dew_point=>37.38,
            :clouds=>0,
            :wind_speed=>7.29,
            :wind_deg=>119,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591632000,
            :temp=>64.2,
            :feels_like=>56.25,
            :pressure=>1008,
            :humidity=>34,
            :dew_point=>35.69,
            :clouds=>0,
            :wind_speed=>8.68,
            :wind_deg=>113,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
           {:dt=>1591635600,
            :temp=>66.99,
            :feels_like=>57.25,
            :pressure=>1008,
            :humidity=>30,
            :dew_point=>34.72,
            :clouds=>0,
            :wind_speed=>11.63,
            :wind_deg=>107,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}],
         :daily=>
          [{:dt=>1591466400,
            :sunrise=>1591443141,
            :sunset=>1591496726,
            :temp=>{:day=>73.71, :min=>72.05, :max=>84.47, :night=>72.05, :eve=>84.47, :morn=>73.71},
            :feels_like=>{:day=>54.39, :night=>64.67, :eve=>70.9, :morn=>54.39},
            :pressure=>1008,
            :humidity=>32,
            :dew_point=>42.04,
            :wind_speed=>31.07,
            :wind_deg=>181,
            :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
            :clouds=>100,
            :uvi=>11.67},
           {:dt=>1591552800,
            :sunrise=>1591529528,
            :sunset=>1591583161,
            :temp=>{:day=>83.1, :min=>64.85, :max=>89.55, :night=>73.33, :eve=>87.4, :morn=>64.85},
            :feels_like=>{:day=>75.15, :night=>63.01, :eve=>71.37, :morn=>58.01},
            :pressure=>1001,
            :humidity=>14,
            :dew_point=>26.71,
            :wind_speed=>7.02,
            :wind_deg=>220,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :clouds=>0,
            :uvi=>10.36},
           {:dt=>1591639200,
            :sunrise=>1591615917,
            :sunset=>1591669595,
            :temp=>{:day=>70.23, :min=>49.66, :max=>79.95, :night=>49.66, :eve=>79.95, :morn=>55.42},
            :feels_like=>{:day=>60.22, :night=>40.17, :eve=>72.79, :morn=>49.5},
            :pressure=>1007,
            :humidity=>26,
            :dew_point=>34.56,
            :wind_speed=>11.9,
            :wind_deg=>110,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :clouds=>0,
            :uvi=>11.06},
           {:dt=>1591725600,
            :sunrise=>1591702307,
            :sunset=>1591756027,
            :temp=>{:day=>65.8, :min=>47.59, :max=>69.39, :night=>61.45, :eve=>68.22, :morn=>47.59},
            :feels_like=>{:day=>52.99, :night=>52.29, :eve=>54.34, :morn=>41.02},
            :pressure=>1016,
            :humidity=>24,
            :dew_point=>20.41,
            :wind_speed=>15.43,
            :wind_deg=>324,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
            :clouds=>32,
            :uvi=>10.06},
           {:dt=>1591812000,
            :sunrise=>1591788699,
            :sunset=>1591842457,
            :temp=>{:day=>75, :min=>58.06, :max=>81.12, :night=>69.37, :eve=>80.92, :morn=>58.06},
            :feels_like=>{:day=>68.74, :night=>62.33, :eve=>71.11, :morn=>51.55},
            :pressure=>1018,
            :humidity=>19,
            :dew_point=>25.92,
            :wind_speed=>4.27,
            :wind_deg=>311,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
            :clouds=>69,
            :uvi=>10.63},
           {:dt=>1591898400,
            :sunrise=>1591875093,
            :sunset=>1591928886,
            :temp=>{:day=>73.99, :min=>58.73, :max=>81.59, :night=>69.84, :eve=>81.59, :morn=>58.73},
            :feels_like=>{:day=>68.5, :night=>67.33, :eve=>73.69, :morn=>51.08},
            :pressure=>1021,
            :humidity=>25,
            :dew_point=>36.48,
            :wind_speed=>4.5,
            :wind_deg=>80,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :clouds=>0,
            :uvi=>11.17},
           {:dt=>1591988400,
            :sunrise=>1591961489,
            :sunset=>1592015314,
            :temp=>{:day=>77.63, :min=>61.18, :max=>84.58, :night=>66.42, :eve=>84.16, :morn=>61.18},
            :feels_like=>{:day=>73.35, :night=>59.79, :eve=>77.05, :morn=>57.25},
            :pressure=>1019,
            :humidity=>27,
            :dew_point=>41.49,
            :wind_speed=>4,
            :wind_deg=>46,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :clouds=>0,
            :uvi=>11.82},
           {:dt=>1592074800,
            :sunrise=>1592047887,
            :sunset=>1592101740,
            :temp=>{:day=>85.68, :min=>63.07, :max=>92.8, :night=>64.53, :eve=>86.56, :morn=>64.27},
            :feels_like=>{:day=>81.63, :night=>62.19, :eve=>78.76, :morn=>63.43},
            :pressure=>1011,
            :humidity=>20,
            :dew_point=>41.25,
            :wind_speed=>3.22,
            :wind_deg=>61,
            :weather=>[{:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10d"}],
            :clouds=>62,
            :rain=>11.1,
            :uvi=>11.69}]}

    @weather = Weather.new(@hash)
    end


   it "exists" do
    expect(@weather).to be_a Weather
   end

   it 'can sanitize_current' do
     current = @weather.sanitize_current(@hash[:current])
     expect(current).to be_a Hash
     expect(current.has_key?(:temp)).to eq(true)
     expect(current.has_key?(:feels_like)).to eq(true)
     expect(current.has_key?(:humidity)).to eq(true)
     expect(current.has_key?(:uvi)).to eq(true)
     expect(current.has_key?(:weather)).to eq(true)
   end

   it 'can sanitize_today' do
     expect(@weather.today).to be_a Hash
     expect(@weather.today.has_key?(:sunrise)).to eq(true)
     expect(@weather.today.has_key?(:sunset)).to eq(true)
     expect(@weather.today.has_key?(:temp)).to eq(true)
     expect(@weather.today.has_key?(:weather)).to eq(true)
   end

   it 'can sanitize_hourly' do
     expect(@weather.hourly).to be_a Array
     expect(@weather.hourly.length).to eq(8)
     expect(@weather.hourly.first.has_key?(:hour)).to eq(true)
     expect(@weather.hourly.first.has_key?(:temp)).to eq(true)
     expect(@weather.hourly.first.has_key?(:weather)).to eq(true)
   end

   it 'can sanitize_daily' do
     expect(@weather.daily).to be_a Array
     expect(@weather.daily.length).to eq(8)
     expect(@weather.daily.first.has_key?(:day)).to eq(true)
     expect(@weather.daily.first.has_key?(:temp)).to eq(true)
     expect(@weather.daily.first.has_key?(:weather)).to eq(true)
   end

   it "can convert dt to day" do
     expect(@weather.to_day(1591725600)).to eq("Tuesday")
   end

end
