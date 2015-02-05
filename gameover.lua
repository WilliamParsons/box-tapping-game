local composer = require( "composer" )
local scene = composer.newScene()
local colors = require( 'colors' )

local background, correctTapsLabel, badTapsLabel, correctTaps, badTaps, correctTapsBox, badTapsBox

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   function newGame()
      composer.gotoScene( 'game', {
         effect = 'fade',
         time = 500
      });
   end

   local sceneGroup = self.view
   local params = event.params;

   local x = display.actualContentWidth / 2;
   local y = ( display.actualContentHeight / 2 ) - 150


   background = display.newRect( sceneGroup, x, y + 150, display.actualContentWidth, display.actualContentHeight )
   -- background:setFillColor( 0.15, 0.7, 0.3 )
   background:setFillColor( colors.darkBlue.r, colors.darkBlue.g, colors.darkBlue.b )

   correctTapsBox = display.newRoundedRect( sceneGroup, x - 150, y + 20, 240, 280, 20 )
   correctTapsBox:setFillColor( colors.brightBlue.r, colors.brightBlue.g, colors.brightBlue.b )

   averageResponseTimeLabel = display.newText({
      parent = sceneGroup,
      text = 'AVERAGE RESPONSE TIME',
      x = x,
      y = y + 330,
      font = native.systemFontBold,
      fontSize = 22,
      align = 'center'
   })

   averageResponseTime = display.newText({
      parent = sceneGroup,
      text = ( math.ceil( params.averageResponseTime / 10 ) / 100 ) .. 's',
      x = x,
      y = y + 260,
      font = native.systemFont,
      fontSize = 100,
      align = 'center'
   })

   correctTapsLabel = display.newText({
      parent = sceneGroup,
      text = 'CORRECT TAPS',
      x = x - 150,
      y = y + 125,
      width = 200,
      height = 40,
      font = native.systemFontBold,
      fontSize = 22,
      align = 'center'
   })
   correctTapsLabel:setFillColor( 1, 1, 1 )

   correctTaps = display.newText({
      parent = sceneGroup,
      text = params.correctTaps,
      x = x - 150,
      y = y - 20,
      width = 200,
      height = 200,
      font = native.systemFont,
      fontSize = 200,
      align = 'center'
   })
   correctTaps:setFillColor( 1, 1, 1 )

   badTapsBox = display.newRoundedRect( sceneGroup, x + 150, y + 20, 240, 280, 20 )
   badTapsBox:setFillColor( colors.red.r, colors.red.g, colors.red.b )

   badTapsLabel = display.newText({
      parent = sceneGroup,
      text = 'BAD TAPS',
      x = x + 150,
      y = y + 125,
      width = 200,
      height = 40,
      font = native.systemFontBold,
      fontSize = 22,
      align = 'center'
   })
   badTapsLabel:setFillColor( 1, 1, 1 )

   badTaps = display.newText({
      parent = sceneGroup,
      text = params.badTaps,
      x = x + 150,
      y = y - 20,
      width = 200,
      height = 200,
      font = native.systemFont,
      fontSize = 200,
      align = 'center'
   })
   badTaps:setFillColor( 1, 1, 1 )

   print(params.averageResponseTime);

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )

---------------------------------------------------------------------------------

return scene