--[[ Feito para Horizon Resources

██╗░░░██╗░██████╗██████╗░░█████╗░░██████╗░░██████╗░░█████╗░███████╗
██║░░░██║██╔════╝██╔══██╗██╔══██╗██╔════╝░██╔════╝░██╔══██╗╚════██║
╚██╗░██╔╝╚█████╗░██║░░██║██║░░██║██║░░██╗░██║░░██╗░██║░░██║░░███╔═╝
░╚████╔╝░░╚═══██╗██║░░██║██║░░██║██║░░╚██╗██║░░╚██╗██║░░██║██╔══╝░░
░░╚██╔╝░░██████╔╝██████╔╝╚█████╔╝╚██████╔╝╚██████╔╝╚█████╔╝███████╗
░░░╚═╝░░░╚═════╝░╚═════╝░░╚════╝░░╚═════╝░░╚═════╝░░╚════╝░╚══════╝
        
    Não remover os créditos!!!!!
]]

local font = {
    dxCreateFont('public/assets/fonts/font.ttf', 22)
}

local fpslimit, lTick, frames, fps = 100, getTickCount(), 0,0

function dashboard()
    --local emprego = getElementData(localPlayer, "Emprego") or "Desempregado"
    local id = getElementData(localPlayer, "ID") or "N/A"
    local bank = getElementData(localPlayer, "moneybank") or 0
    --local vip = getElementData(localPlayer, "Premium") or "Nenhum"
    local level = getElementData(localPlayer, "Level") or 0
    local x, y, z = getElementPosition(localPlayer)
    local zone = getZoneName(x, y, z) or "Sem Sinal"
    local ping = getPlayerPing(localPlayer)
    local tick = getTickCount()
    local time = tick - lTick

    if time >= 1000 then
        fps = frames
        lTick = tick
        frames = 2
    else 
        frames = frames + 1
    end
    if fps > fpslimit then
        fps = fpslimit 
    end
    local players = getElementsByType("player")

    dxDrawImage(447, 317, 1032, 565, 'public/assets/imgs/base.png')
    dxDrawImage(440, 343, 74, 49, 'public/assets/imgs/logo.png')
    dxDrawText('Dashboard', 514, 354, 103, 28, tocolor(177, 177, 177, 255), 0.75, font[1], 'left', 'center')
    dxDrawText('Suas Informações', 819, 356, 171, 28, tocolor(177, 177, 177, 255), 0.75, font[1], 'left', 'center')
    dxDrawText('Identificação:', 850, 560, 128, 28, tocolor(79, 79, 79, 255), 0.70, font[1], 'left', 'center')
    dxDrawText('Level:', 850, 607, 55, 28, tocolor(79, 79, 79, 255), 0.70, font[1], 'left', 'center')
    dxDrawText('Dinheiro:', 852, 649, 84, 28, tocolor(79, 79, 79, 255), 0.70, font[1], 'left', 'center')
    dxDrawText('Dinheiro no banco:', 850, 698, 177, 28, tocolor(79, 79, 79, 255), 0.70, font[1], 'left', 'center')

    dxDrawText("#"..id, 894, 463, 73, 42, tocolor(173, 135, 255, 255), 0.60, font[1], 'left', 'center')
    dxDrawText(level, 909, 609, 22, 26, tocolor(177, 177, 177, 255), 0.60, font[1], 'left', 'center')
    dxDrawText(getPlayerMoney(localPlayer).."€", 941, 651, 22, 26, tocolor(177, 177, 177, 255), 0.60, font[1], 'left', 'center')
    dxDrawText(zone, 1261, 481, 79, 18, tocolor(173, 135, 255, 255), 0.50, font[1], 'center', 'center')
    dxDrawText(getPlayerName(localPlayer), 819, 461, 73, 42, tocolor(177, 177, 177, 255), 0.7, font[1], 'center', 'center')
    dxDrawText("#"..id, 976, 563, 23, 26, tocolor(177, 177, 177, 255), 0.7, font[1], 'left', 'center')
    dxDrawText(ping.."ms / "..tostring(fps).."fps", 823, 496, 90, 20, tocolor(173, 135, 255, 255), 0.5, font[1], 'left', 'center')
    dxDrawText(bank.."€", 1035, 699, 22, 26, tocolor(177, 177, 177, 255), 0.60, font[1], 'left', 'center')

    
end

bindKey("tab", "down", function()
    if dashon then
        removeEventHandler("onClientRender", root, dashboard)
        dashon = false
        playSoundFrontEnd(33)
    else
        addEventHandler("onClientRender", root, dashboard)
        dashon = true
        playSoundFrontEnd(33)
    end
end)
