script_name('MathPro')
script_version('0.3')
script_author('TMoore')

require "lib.moonloader"
local dlstatus = require('moonloader').download_status
local encoding = require "encoding"
local iconv = require 'samp.events'
-- local notify = import 'lib_imgui_notf.lua'
local imgui = require "imgui"
imgui.ToggleButton = require('imgui_addons').ToggleButton
encoding.default = 'CP1251'
u8 = encoding.UTF8

local Num1 = {'-', "+", "*", "/"}
local Num_1 = {'-', "+", "*", "/"}
local Numm_2 = {'-', "+", "*", "/"}
local Num_33 = {'-', "+", "*", "/"}
local Num_2 = {'-', "+", "*", "/"}
local num_result = 0
local num = 0
local dopinput = 0
local shet = 0
local Combo_num = imgui.ImInt(0)
local Combo_num1 = imgui.ImInt(0)
local Combo_two = imgui.ImInt(0)
local Combo_num3 = imgui.ImInt(0)
local num1 = imgui.ImBuffer(256)
local num2 = imgui.ImBuffer(256)
local num_1 = imgui.ImBuffer(256)
local num_2 = imgui.ImBuffer(256)
local Version_change = imgui.ImBuffer(65536)
local num_3 = imgui.ImBuffer(256)
local num_4 = imgui.ImBuffer(256)
local X, Y = getScreenResolution()
local Vvodchisel = imgui.ImBool(false)
local result = imgui.ImBool(false)

Version_Script = [[
Ver 0.3
1.Автообновление
Ver 0.2
1.Логика
]]

function infinity()
    Version_change.v = u8:encode(Version_Script)
end


function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    sampRegisterChatCommand('calcp', function() Vvodchisel.v = not Vvodchisel.v imgui.Process = Vvodchisel.v end)

    sampAddChatMessage('[Math] Скрипт успешно загружен! Автор: TMoore', -1)

    lua_thread.create(infinity)
end

function imgui.OnDrawFrame()

    if not result.v and not Vvodchisel.v then
        imgui.Process = false
    end

    if Vvodchisel.v then
        imgui.SetNextWindowSize(imgui.ImVec2(700, 240), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8'[Calculator Ver: '..thisScript().version.. u8'] Введите числа для подсчета.', Vvodchisel, imgui.WindowFlags.NoResize)
                imgui.BeginChild('Buttons', imgui.ImVec2(200, 205), true)
                    if imgui.Button(u8'Калькулятор', imgui.ImVec2(-1, 30)) then menu = 0 end
                    if imgui.Button(u8'Автообновление', imgui.ImVec2(-1, 30)) then menu = 1 end
                    -- if imgui.Button(u8'Настройки', imgui.ImVec2(-1, 30)) then menu = 2 end
                imgui.EndChild()
                imgui.SameLine()
                if menu == 0 then
                    if shet == 0 then
                        imgui.BeginChild('Calc', imgui.ImVec2(476, 65), true)
                            imgui.PushItemWidth(120)
                            imgui.InputText(u8'##1', num1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(100)
                            imgui.Combo(' ', Combo_num, Num1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(120)
                            imgui.SetCursorPos(imgui.ImVec2(244, 8))
                            imgui.InputText('##2', num2)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.Text(u8'=  '..num)
                            if imgui.Button(u8'Решить', imgui.ImVec2(-1, 25)) then
                                if Combo_num.v == 0 then
                                    num = num1.v - num2.v
                                        shet = 1
                                elseif Combo_num.v == 1 then
                                    num = num1.v + num2.v
                                        shet = 1
                                elseif Combo_num.v == 2 then
                                    num = num1.v * num2.v
                                        shet = 1
                                elseif Combo_num.v == 3 then
                                    num = num1.v / num2.v
                                        shet = 1
                                end
                            end
                        imgui.EndChild()
                        elseif shet == 1 then
                        imgui.BeginChild('Calc', imgui.ImVec2(476, 65), true)
                            imgui.PushItemWidth(120)
                            imgui.InputText(u8'##3', num1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(100)
                            imgui.Combo(' ', Combo_num, Num1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(120)
                            imgui.SetCursorPos(imgui.ImVec2(244, 8))
                            imgui.InputText('##4', num2)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.Text(u8'=  '..num)
                                -- imgui.Button(u8'Решить', imgui.ImVec2(228, 25))
                                -- imgui.SameLine()
                                if imgui.Button(u8'Сбросить', imgui.ImVec2(-1, 25)) then
                                    num1.v = ''
                                        num2.v = ''
                                            shet = 0
                                                num = 0
                                end
                        imgui.EndChild()
                    end
                        imgui.SetCursorPos(imgui.ImVec2(216, 97))
                        imgui.BeginChild('Virazh', imgui.ImVec2(476, 136), true)
                            imgui.PushItemWidth(100)
                            imgui.InputText('##5', num_1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(60)
                            imgui.Combo(' ', Combo_num1, Num_1)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            imgui.PushItemWidth(100)
                            imgui.SetCursorPos(imgui.ImVec2(185, 8))
                            imgui.InputText('##6', num_2)
                            imgui.PopItemWidth()
                            imgui.SameLine()
                            if dopinput == 1 then
                                imgui.PushItemWidth(60)
                                imgui.Combo('   ', Combo_two, Num_2)
                                imgui.PopItemWidth()
                                imgui.SameLine()
                                imgui.PushItemWidth(100)
                                imgui.SetCursorPos(imgui.ImVec2(361, 8))
                                imgui.InputText('##7', num_3)
                                imgui.PopItemWidth()
                            elseif dopinput == 2 then
                                imgui.PushItemWidth(60)
                                imgui.Combo('   ', Combo_two, Numm_2)
                                imgui.PopItemWidth()
                                imgui.SameLine()
                                imgui.PushItemWidth(100)
                                imgui.SetCursorPos(imgui.ImVec2(361, 8))
                                imgui.InputText('##8', num_3)
                                imgui.PopItemWidth()
                                imgui.SetCursorPos(imgui.ImVec2(8, 32))
                                imgui.PushItemWidth(60)
                                imgui.Combo('  ', Combo_num3, Num_33)
                                imgui.PopItemWidth()
                                imgui.SameLine()
                                imgui.PushItemWidth(100)
                                imgui.SetCursorPos(imgui.ImVec2(73, 33))
                                imgui.InputText('##9', num_4)
                                imgui.PopItemWidth()
                                imgui.SameLine()
                            end
                                if dopinput ~= 2 then
                                    if imgui.Button('+', imgui.ImVec2(35, 20)) then
                                        dopinput = dopinput + 1
                                    end
                                end
                            imgui.SameLine()
                            imgui.Text(u8'=  '..num_result)
                            if imgui.Button(u8'Решить', imgui.ImVec2(226, 25)) then
                                if dopinput == 0 then
                                    if Combo_num1.v == 0 then -- Результат без добавления input
                                        num_result = num_1.v - num_2.v
                                    elseif Combo_num1.v == 1 then
                                        num_result = num_1.v + num_2.v
                                    elseif Combo_num1.v == 2 then
                                        num_result = num_1.v * num_2.v
                                    elseif Combo_num1.v == 3 then
                                        num_result = num_1.v / num_2.v
                                    end
                                end
                                -- результат с добавлением первого элемента
                                if dopinput == 1 then
                                    if Combo_num1.v == 0 and Combo_two.v == 0 then
                                        num_result = num_1.v - num_2.v - num_3.v
                                        elseif Combo_num1.v == 0 and Combo_two.v == 1 then
                                        num_result = num_1.v - num_2.v + num_3.v
                                        elseif Combo_num1.v == 0 and Combo_two.v == 2 then
                                        num_result = num_1.v - num_2.v * num_3.v
                                        elseif Combo_num1.v == 0 and Combo_two.v == 3 then
                                        num_result = num_1.v - num_2.v / num_3.v
                                    end
                                    if Combo_num1.v == 1 and Combo_two.v == 0 then
                                        num_result = num_1.v + num_2.v - num_3.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 1 then
                                        num_result = num_1.v + num_2.v + num_3.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 then
                                        num_result = num_1.v + num_2.v * num_3.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 then
                                        num_result = num_1.v + num_2.v / num_3.v
                                    end 
                                    if Combo_num1.v == 2 and Combo_two.v == 0 then
                                        num_result = num_1.v * num_2.v - num_3.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 then
                                        num_result = num_1.v * num_2.v + num_3.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 then
                                        num_result = num_1.v * num_2.v * num_3.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 then
                                        num_result = num_1.v * num_2.v / num_3.v
                                    end 
                                    if Combo_num1.v == 3 and Combo_two.v == 0 then
                                        num_result = num_1.v / num_2.v - num_3.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 then
                                        num_result = num_1.v / num_2.v + num_3.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 then
                                        num_result = num_1.v / num_2.v * num_3.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 3 then
                                        num_result = num_1.v / num_2.v / num_3.v
                                    end
                                end
                                -- результат с добавлением второго элемента
                                if dopinput == 2 then
                                    if Combo_num1.v == 0 and Combo_two.v == 0 and Combo_num3.v == 0 then
                                        num_result = num_1.v - num_2.v - num_3.v - num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 1 and Combo_num3.v == 0 then
                                        num_result = num_1.v - num_2.v + num_3.v - num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 1 and Combo_num3.v == 2 then
                                        num_result = num_1.v - num_2.v + num_3.v * num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 1 and Combo_num3.v == 3 then
                                        num_result = num_1.v - num_2.v + num_3.v / num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                        num_result = num_1.v - num_2.v * num_3.v - num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 3 and Combo_num3.v == 0 then
                                        num_result = num_1.v - num_2.v / num_3.v - num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 1 and Combo_num3.v == 1 then
                                        num_result = num_1.v - num_2.v + num_3.v + num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 2 and Combo_num3.v == 1 then
                                        num_result = num_1.v - num_2.v * num_3.v + num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 2 and Combo_num3.v == 2 then
                                        num_result = num_1.v - num_2.v * num_3.v * num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 2 and Combo_num3.v == 3 then
                                        num_result = num_1.v - num_2.v * num_3.v / num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 3 and Combo_num3.v == 3 then
                                        num_result = num_1.v - num_2.v / num_3.v / num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 0 and Combo_num3.v == 1 then
                                        num_result = num_1.v - num_2.v - num_3.v + num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 0 and Combo_num3.v == 2 then
                                        num_result = num_1.v - num_2.v - num_3.v * num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 0 and Combo_num3.v == 3 then
                                        num_result = num_1.v - num_2.v - num_3.v / num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 3 and Combo_num3.v == 1 then
                                        num_result = num_1.v - num_2.v / num_3.v + num_4.v
                                    elseif Combo_num1.v == 0 and Combo_two.v == 3 and Combo_num3.v == 2 then
                                        num_result = num_1.v - num_2.v / num_3.v * num_4.v
                                    end 
                                    if Combo_num1.v == 1 and Combo_two.v == 0 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v - num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 1 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 0 and Combo_num3.v == 1 then
                                            num_result = num_1.v + num_2.v - num_3.v + num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 0 and Combo_num3.v == 2 then
                                            num_result = num_1.v + num_2.v - num_3.v * num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 0 and Combo_num3.v == 3 then
                                            num_result = num_1.v + num_2.v - num_3.v / num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 1 and Combo_num3.v == 1 then
                                            num_result = num_1.v + num_2.v + num_3.v + num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 1 and Combo_num3.v == 2 then
                                            num_result = num_1.v + num_2.v + num_3.v * num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 1 and Combo_num3.v == 3 then
                                            num_result = num_1.v + num_2.v + num_3.v / num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 2 then
                                            num_result = num_1.v + num_2.v * num_3.v * num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 1 then
                                            num_result = num_1.v + num_2.v * num_3.v + num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 2 then
                                            num_result = num_1.v + num_2.v * num_3.v * num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 3 then
                                            num_result = num_1.v + num_2.v * num_3.v / num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 3 then
                                            num_result = num_1.v + num_2.v / num_3.v / num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 1 then
                                            num_result = num_1.v + num_2.v / num_3.v + num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 2 then
                                            num_result = num_1.v + num_2.v / num_3.v * num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 3 then
                                            num_result = num_1.v + num_2.v / num_3.v / num_4.v
                                    end
                                    if Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 0 then
                                            num_result = num_1.v * num_2.v - num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 0 then 
                                            num_result = num_1.v * num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 1 then 
                                            num_result = num_1.v * num_2.v + num_3.v + num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 2 then 
                                            num_result = num_1.v * num_2.v + num_3.v * num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 3 then 
                                            num_result = num_1.v * num_2.v + num_3.v / num_4.v  
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 0 then 
                                            num_result = num_1.v * num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 1 then 
                                            num_result = num_1.v * num_2.v * num_3.v + num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 2 then 
                                            num_result = num_1.v * num_2.v * num_3.v * num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 3 then 
                                            num_result = num_1.v * num_2.v * num_3.v / num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 and Combo_num3.v == 0 then 
                                            num_result = num_1.v * num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 and Combo_num3.v == 1 then 
                                            num_result = num_1.v * num_2.v / num_3.v + num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 and Combo_num3.v == 2 then 
                                            num_result = num_1.v * num_2.v / num_3.v * num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 and Combo_num3.v == 3 then 
                                            num_result = num_1.v * num_2.v / num_3.v / num_4.v                                            
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 1 then
                                            num_result = num_1.v * num_2.v - num_3.v + num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 2 then
                                            num_result = num_1.v * num_2.v - num_3.v * num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 3 then
                                            num_result = num_1.v * num_2.v - num_3.v / num_4.v
                                    end
                                    if Combo_num1.v == 3 and Combo_two.v == 0 and Combo_num3.v == 0 then
                                            num_result = num_1.v / num_2.v - num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 and Combo_num3.v == 0 then 
                                            num_result = num_1.v / num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 and Combo_num3.v == 1 then 
                                            num_result = num_1.v / num_2.v + num_3.v + num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 and Combo_num3.v == 2 then 
                                            num_result = num_1.v / num_2.v + num_3.v * num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 and Combo_num3.v == 3 then 
                                            num_result = num_1.v / num_2.v + num_3.v / num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                            num_result = num_1.v / num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 and Combo_num3.v == 1 then 
                                            num_result = num_1.v / num_2.v * num_3.v + num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 and Combo_num3.v == 2 then 
                                            num_result = num_1.v / num_2.v * num_3.v * num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 and Combo_num3.v == 3 then 
                                            num_result = num_1.v / num_2.v * num_3.v / num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 3 and Combo_num3.v == 0 then 
                                            num_result = num_1.v / num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 3 and Combo_num3.v == 1 then 
                                            num_result = num_1.v / num_2.v / num_3.v + num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 3 and Combo_num3.v == 2 then 
                                            num_result = num_1.v / num_2.v / num_3.v * num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 3 and Combo_num3.v == 3 then 
                                            num_result = num_1.v / num_2.v / num_3.v / num_4.v   
                                        elseif Combo_num1.v == 3 and Combo_two.v == 0 and Combo_num3.v == 1 then
                                            num_result = num_1.v / num_2.v - num_3.v + num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 0 and Combo_num3.v == 2 then
                                            num_result = num_1.v / num_2.v - num_3.v * num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 0 and Combo_num3.v == 3 then
                                            num_result = num_1.v / num_2.v - num_3.v / num_4.v
                                    end
                                    if Combo_num1.v == 1 and Combo_two.v == 1 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 1 and Combo_two.v == 3 and Combo_num3.v == 0 then
                                            num_result = num_1.v + num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 0 then
                                            num_result = num_1.v * num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                            num_result = num_1.v * num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 3 and Combo_num3.v == 0 then
                                            num_result = num_1.v * num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 1 and Combo_num3.v == 0 then
                                            num_result = num_1.v / num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 3 and Combo_two.v == 2 and Combo_num3.v == 0 then
                                            num_result = num_1.v / num_2.v * num_3.v - num_4.v
                                    end
                                    if Combo_num1.v == 3 and Combo_two.v == 3 and Combo_num3.v == 0 then
                                            num_result = num_1.v / num_2.v / num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 1 and Combo_num3.v == 0 then 
                                            num_result = num_1.v / num_2.v + num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 2 and Combo_num3.v == 0 then 
                                            num_result = num_1.v / num_2.v * num_3.v - num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 1 then
                                            num_result = num_1.v / num_2.v - num_3.v + num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 2 then
                                            num_result = num_1.v / num_2.v - num_3.v * num_4.v
                                        elseif Combo_num1.v == 2 and Combo_two.v == 0 and Combo_num3.v == 3 then
                                            num_result = num_1.v / num_2.v - num_3.v / num_4.v
                                    end
                                end
                            end
                            imgui.SameLine()
                            if imgui.Button(u8'Сбросить значения', imgui.ImVec2(226, 25)) then
                                num_1.v = ''
                                    num_2.v = ''
                                        num_3.v = ''
                                            num_4.v = ''
                                                num_result = 0
                                                    Combo_num1.v = 0
                                                        Combo_two.v = 0
                                                            Combo_num3.v = 0
                                                                -- notify.addNotify('Calculator Ver '..thisScript().version,'Вы сбросили все значения!',1,1,4)
                            end
                        imgui.EndChild()
                end
                imgui.SameLine()
                if menu == 1 then
                    imgui.BeginChild('AutoUpdate', imgui.ImVec2(476, 205), true)
                        imgui.CenterTextColoredRGB('Здесь Вы можете проверить скрипт на актуальную версию.')
                        if imgui.Button(u8'Проверка обновления', imgui.ImVec2(-1, 25)) then
                            if update == true then
                                sampAddChatMessage('[Calculator] Обновление было найдено! Начинается скачивание!')
                                    update()
                            elseif update == false then
                                sampAddChatMessage('[Calculator] Обновление не требуется! Установлена самая последняя версия.')
                            end
                        end
                        imgui.Separator()
                        imgui.InputTextMultiline('##VersionBlog', Version_change, imgui.ImVec2(460, 140), imgui.InputTextFlags.ReadOnly)
                    imgui.EndChild()
                end
                -- imgui.SameLine()
                -- if menu == 2 then
                --     imgui.BeginChild('Settings', imgui.ImVec2(476, 205), true)

                --     imgui.EndChild()
                -- end
            imgui.End()
    end
end

function imgui.CenterText(text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local textsize = w:gsub('{.-}', '')
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else
                imgui.Text(u8(w))
            end
        end
    end
    render_text(text)
end

function imgui.CenterTextColoredRGB(text)
    local width = imgui.GetWindowWidth()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local textsize = w:gsub('{.-}', '')
            local text_width = imgui.CalcTextSize(u8(textsize))
            imgui.SetCursorPosX( width / 2 - text_width .x / 2 )
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else
                imgui.Text(u8(w))
            end
        end
    end
    render_text(text)
end

function goupdate()
    print(('[Calculator] Обнаружено обновление. AutoReload может конфликтовать. Обновляюсь...'), color)
    print(('[Calculator] Текущая версия: '..thisScript().version..". Новая версия: "..version), color)
    wait(300)
    downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23) -- качает ваш файлик с latest version
        if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
            print(('[Calculator] Обновление завершено!'), color)
                print(('[Calculator] Перезапускаю скрипт!'), color)
                    thisScript():reload()
        end
    end)
end

function update()
    local fpath = os.getenv('TEMP') .. '\\New_version.json' -- куда будет качаться наш файлик для сравнения версии
    downloadUrlToFile('', fpath, function(id, status, p1, p2) -- ссылку на ваш гитхаб где есть строчки которые я ввёл в теме или любой другой сайт
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
        local f = io.open(fpath, 'r') -- открывает файл
            if f then
                local info = decodeJson(f:read('*a')) -- читает
                    updatelink = info.updateurl
                    if info and info.latest then
                    version = tonumber(info.latest) -- переводит версию в число
                        if version > tonumber(thisScript().version) then -- если версия больше чем версия установленная то...
                            lua_thread.create(goupdate) -- апдейт
                        else -- если меньше, то
                            update = false -- не даём обновиться 
                                print('Ваша версия: '..thisScript().version)
                                    print('Обновление не требуется')
                        end
                    end
            end
        end
    end)
end