--[[

■ スマホスタンド サンプルスクリプト: LEDを点滅させます

このファイル(bootscript.lua)を、FlashAirのルートディレクトリ直下に配置してください。
また、CONFIGファイルを修正する必要があります。

FlashAirルートディレクトリ
├ bootscript.lua
├ SW_WLAN
   └ CONFIG

CONFIGファイルに下記を追記してください。

IFMODE=1
LUA_RUN_SCRIPT=/bootscript.lua

]]--

while(1) do
-- SWの値を読み取る
s, indata = fa.pio(0x0E,0x00)

-- SWの値が1なら、LEDを順番に点滅させる
if indata == 0x01 then
        fa.pio(0x0E,0x02)
        sleep(500)
        fa.pio(0x0E,0x00)
        sleep(500)

        fa.pio(0x0E,0x04)
        sleep(500)
        fa.pio(0x0E,0x00)
        sleep(500)

        fa.pio(0x0E,0x08)
        sleep(500)
        fa.pio(0x0E,0x00)
        sleep(500)

-- SWの値が0なら、LEDをソフトPWMで点滅させる
else
	for k=0,8 do
	for j=0,16 do
	for i=0,8 do
	if(i<k) then
        	fa.pio(0x0E,0x02)
        else
        	fa.pio(0x0E,0x00)
        end
	end
	end
	end

	for k=0,8 do
	for j=0,16 do
	for i=0,8 do
	if(i<k) then
        	fa.pio(0x0E,0x00)
        else
        	fa.pio(0x0E,0x02)
        end
	end
	end
	end
end
end