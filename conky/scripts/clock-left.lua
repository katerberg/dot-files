--[[
Clock Rings by londonali1010 (2009)
Configuration by Ninquitassar (2012)

This script draws percentage meters as rings, and also draws clock hands if you want! It is fully customisable; all options are described in the script. This script is based off a combination of my clock.lua script and my rings.lua script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement near the end of the script uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
  lua_load ~/scripts/clock_rings-v1.1.1.lua
  lua_draw_hook_pre clock_rings

Changelog:
+ v1.1.1 -- Fixed minor bug that caused the script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.1 -- Added colour option for clock hands (07.10.2009)
+ v1.0 -- Original release (30.09.2009)
]]

  -- Screen width in pixels
  screen_width=800

  -- Weather location
  weather_x=screen_width-100
  weather_y=112

  -- Wifi quality location
  wifi_qual_x=screen_width-145
  wifi_qual_y=277

  -- Wifi transfer speed location
  wifi_trans_x=screen_width-195
  wifi_trans_y=466

  -- Thermal location
  therm_x=screen_width-125
  therm_y=673
  

settings_table = {
  {
      name='wireless_link_qual_perc',
      arg='wlan0',
      max=100,
      bg_colour=0xffffff,
      bg_alpha=0.1,
      fg_colour=0xd7d7d7,
      fg_alpha=0.6,
      radius=30,
      thickness=10,
      start_angle=0,
      end_angle=360,
      x=wifi_qual_x, y=wifi_qual_y
    },
 {
    name='downspeedf',
	arg='wlan0',
	max=1500,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=40,
    thickness=3,
    start_angle=0,
    end_angle=360,
    x=wifi_trans_x, y=wifi_trans_y
  },
{
    name='upspeedf',
	arg='wlan0',
	max=500,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=30,
    thickness=10,
    start_angle=0,
    end_angle=360,
    x=wifi_trans_x, y=wifi_trans_y
  },
{
    name='hwmon',
	arg='0 temp 1',
	max=84,
	min=30,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=35,
    thickness=8,
    start_angle=0,
    end_angle=360,
    x=therm_x, y=therm_y
  },
{
    name='hwmon',
	arg='0 temp 2',
	max=84,
	min=30,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=43,
    thickness=5,
    start_angle=0,
    end_angle=360,
    x=therm_x, y=therm_y
  },
{
    name='hwmon',
	arg='0 temp 3',
	max=84,
	min=30,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=48,
    thickness=3,
    start_angle=0,
    end_angle=360,
    x=therm_x, y=therm_y
  },
{
    name='hwmon',
	arg='0 temp 4',
	max=84,
	min=30,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=27,
    thickness=5,
    start_angle=0,
    end_angle=360,
    x=therm_x, y=therm_y
  },
{
    name='hwmon',
	arg='0 temp 5',
	max=84,
	min=30,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=22,
    thickness=3,
    start_angle=0,
    end_angle=360,
    x=therm_x, y=therm_y
  }
}

weather_settings={
    min=-15,
    max=45,
    bg_colour=0xffffff,
    bg_alpha=0.1,
    fg_colour=0xd7d7d7,
    fg_alpha=0.6,
    radius=55,
    thickness=5,
    start_angle=0,
    end_angle=360,
    x=weather_x, y=weather_y
  }
require 'cairo'

function rgb_to_r_g_b(colour,alpha)
  return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)
  local w,h=conky_window.width,conky_window.height

  local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
  local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

  local angle_0=sa*(2*math.pi/360)-math.pi/2
  local angle_f=ea*(2*math.pi/360)-math.pi/2
  local t_arc=t*(angle_f-angle_0)

  --Draw background ring
  cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
  cairo_set_line_width(cr,ring_w)
  cairo_stroke(cr)

  --Draw indicator ring
  cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
  cairo_stroke(cr)

end


function conky_clock_rings()
  local function setup_rings(cr,pt)
      local str=''
      local value=0

      str=string.format('${%s %s}',pt['name'],pt['arg'])
      str=conky_parse(str)

      value=tonumber(str)
      if value == nil then value = 0 end

      local min=pt['min']
      if min == nil then min = 0 end
      pct=(value - min)/pt['max']
      draw_ring(cr,pct,pt)
  end

--Check that Conky has been running for at least 5s
  if conky_window==nil then return end
  local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)

  local cr=cairo_create(cs)  

  local updates=conky_parse('${updates}')
  update_num=tonumber(updates)

  if update_num==5 then weather_temp='0' end
  if update_num>5 then
    for i in pairs(settings_table) do
      setup_rings(cr, settings_table[i])
    end

    if (update_num + 354) % 360 == 0 then
        local weather_temp_exec='${execp curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\\?metric\\=1\\&locCode\\=63124 | grep \\<title\\>Currently | sed "s/^.*Currently: \\([^:]*\\): \\([^C]*\\).*$/\\2/"}'
        weather_temp=conky_parse(weather_temp_exec)
    end
    local pct=((weather_temp - weather_settings['min']) / (math.abs(weather_settings['max']) + math.abs(weather_settings['min'])))
    draw_ring(cr,pct,weather_settings)
    
  end

end
