' ----------------------------------------------------------------------------
' Blitz-Irrlicht 1.8.3 Wrapper by Ed Musolino (2015)
' Based off of Frank Dodd's Irrlicht 1.7.1 Freebasic Wrapper (2006-2010)
' FreeBasic Irrlicht 1.8.5 & irrKlang 1.6.0 by <jepalza@gmail.com> (Joseba Epalza, 2022) 
' ----------------------------------------------------------------------------

'  This software is provided 'as-is', without any express Or implied
'  warranty.  In no event will the authors be held liable For any damages
'  arising from the use of this software.

'  Permission is granted To anyone To use this software For any purpose,
'  including commercial applications, And To alter it And redistribute it
'  freely, subject To the following restrictions:

'  1. The Origin of this software must Not be misrepresented' you must not
'     claim that you wrote the original software. If you use this software
'     in a product, an acknowledgement in the product documentation would be
'     appreciated but is Not required.
'  2. Altered source versions must be clearly marked as such, And must Not be
'     misrepresented as being the original software.
'  3. This notice may Not be removed Or altered from any source distribution.
'
'  This source uses Irrlicht definitions created by the Irrlicht authors.
'
' /////////////////////////////////////////////////////////////////////////////

#Include "fb_Irrlicht_const.bi"

  Declare Function iIrr3D CDecl Alias "iIrr3D" (ByVal Width2 As Integer,Byval Height As Integer,Byval bpp As Integer,Byval fullscreen As Integer) As Integer
  Declare Function iIrr3DAdvanced Cdecl Alias "iIrr3DAdvanced" (ByVal WindowID As Integer,ByVal drivertype As Integer,Byval scrWidth As Integer,Byval scrHeight As Integer,Byval bits As Integer,Byval fullscreen As Integer,Byval shadows As Integer,Byval dontignoreinput As Integer,Byval vsyncenabled As Integer,Byval devicetype As Integer,Byval doublebufferenabled As Integer,Byval antialiasenabled As Integer,Byval highprecisionfpu As Integer) As Integer

  Declare Sub      iVSync Cdecl Alias "iVSync" (ByVal apply As Integer)
  Declare Sub      iUseDirect3D9 Cdecl Alias "iUseDirect3D9" ()
  Declare Sub      iUseOpenGL Cdecl Alias "iUseOpenGL" ()
  Declare Sub      iUseSoftware Cdecl Alias "iUseSoftware" ()
  
  Declare Sub      iEndIrr3D Cdecl Alias "iEndIrr3D" ()
  
  Declare Function iRun Cdecl Alias "iRun" () As Integer
  Declare Sub      iAppTitle Cdecl Alias "iAppTitle" (ByVal title As ZString Ptr)
   
  Declare Sub      iBeginScene Cdecl Alias "iBeginScene" ()
  Declare Sub      iBeginSceneAdvanced Cdecl Alias "iBeginSceneAdvanced" (ByVal sceneBackgroundColor As Integer,Byval clearBackBuffer As Integer,Byval clearZBuffer As Integer)
  
  Declare Sub      iCameraCLSColor Cdecl Alias "iCameraCLSColor" (ByVal r As Integer,Byval g As Integer,Byval b As Integer)
  Declare Sub      iDrawScene Cdecl Alias "iDrawScene" ()
  Declare Sub      iEndScene Cdecl Alias "iEndScene" ()
  Declare Function iTrisDrawn Cdecl Alias "iTrisDrawn" () As Integer
  Declare Function iQueryFeature Cdecl Alias "iQueryFeature" (ByVal feature As Integer) As Integer
  Declare Sub      iDisableFeature Cdecl Alias "iDisableFeature" (ByVal feature As Integer,Byval state As Integer)
  Declare Function iGetFPS Cdecl Alias "iGetFPS" () As Integer
  Declare Function iTime Cdecl Alias "iTime" () As Integer
  Declare Function iGraphicsWidth Cdecl Alias "iGraphicsWidth" () As Integer
  Declare Function iGraphicsHeight Cdecl Alias "iGraphicsHeight" () As Integer
  Declare Sub      iViewPort Cdecl Alias "iViewPort" (ByVal x As Integer,Byval y As Integer,Byval Width2 As Integer,Byval Height As Integer)
  Declare Sub      iClearScene Cdecl Alias "iClearScene" ()
  Declare Sub      iAmbientLight Cdecl Alias "iAmbientLight" (ByVal r As Single,Byval g As Single,Byval b As Single)
  Declare Sub      iShadowColor Cdecl Alias "iShadowColor" (ByVal alpha2 As Integer,Byval r As Integer,Byval g As Integer,Byval b As Integer)
  Declare Sub      iCameraFog Cdecl Alias "iCameraFog" (ByVal r As Integer,Byval g As Integer,Byval b As Integer,Byval fogtype As Integer,Byval near As Single,Byval far As Single,Byval density As Single)
  Declare Sub      iDraw3DLine Cdecl Alias "iDraw3DLine" (ByVal xStart As Single,Byval yStart As Single,Byval zStart As Single,Byval xEnd As Single,Byval yEnd As Single,Byval zEnd As Single,Byval R As Integer,Byval G As Integer,Byval B As Integer)
  Declare Sub      iWritePixelFast Cdecl Alias "iWritePixelFast" (ByVal x As Integer,Byval y As Integer,Byval Imagen As Integer)
  Declare Function iReadPixelFast Cdecl Alias "iReadPixelFast" (ByVal x As Integer,Byval y As Integer,Byval Imagen As Integer) As Integer
  Declare Sub      iLoadScene Cdecl Alias "iLoadScene" (ByVal filename As ZString Ptr)
  Declare Sub      iSaveScene Cdecl Alias "iSaveScene" (ByVal filename As ZString Ptr)
  Declare Sub      iTransparentZWrite Cdecl Alias "iTransparentZWrite" (ByVal On As Integer)
  Declare Function iLoadFont Cdecl Alias "iLoadFont" (ByVal path As ZString Ptr) As Integer
  Declare Sub      iText Cdecl Alias "iText" (ByVal font As Integer,Byval text As ZString Ptr,Byval top_x As Integer,Byval top_y As Integer,Byval bottom_x As Integer,Byval bottom_y As Integer)
  Declare Sub      iColor Cdecl Alias "iColor" (ByVal alpha2 As Integer,Byval red As Integer,Byval green As Integer,Byval blue As Integer)
  
  Declare Function iKeyHit Cdecl Alias "iKeyHit" (ByVal key As Integer) As Integer
  Declare Function iKeyDown Cdecl Alias "iKeyDown" (ByVal key As Integer) As Integer
  Declare Sub      iFlushKeys Cdecl Alias "iFlushKeys" ()
  Declare Function iGetKey Cdecl Alias "iGetKey" () As Integer
  Declare Sub      iWaitKey Cdecl Alias "iWaitKey" ()
    
  Declare Function iMouseDown Cdecl Alias "iMouseDown" (ByVal button As Integer) As Integer
  Declare Function iMouseWheel Cdecl Alias "iMouseWheel" () As Single
  Declare Sub      iFlushMouse Cdecl Alias "iFlushMouse" ()
  Declare Sub      iShowMouse Cdecl Alias "iShowMouse" ()
  Declare Sub      iHideMouse Cdecl Alias "iHideMouse" ()
  Declare Sub      iMoveMouse Cdecl Alias "iMoveMouse" (ByVal x As Single,Byval y As Single)
  Declare Function iMouseX Cdecl Alias "iMouseX" () As Integer
  Declare Function iMouseY Cdecl Alias "iMouseY" () As Integer
  
  Declare Function iGetLastSelectedFile Cdecl Alias "iGetLastSelectedFile" () As String
  
  Declare Function iCreateWater Cdecl Alias "iCreateWater" (ByVal mesh As Integer,Byval waveHeight As Single,Byval waveSpeed As Single,Byval waveLength As Single,Byval parent As Integer,Byval id As Integer,Byval positionX As Single,Byval positionY As Single,Byval positionZ As Single,Byval rotationX As Single,Byval rotationY As Single,Byval rotationZ As Single,Byval scaleX As Single,Byval scaleY As Single,Byval scaleZ As Single) As Integer
  Declare Function iCreateClouds Cdecl Alias "iCreateClouds" (ByVal texture As Integer,Byval lod As Integer,Byval depth As Integer,Byval density As Integer) As Integer
  Declare Function iCreateFlare Cdecl Alias "iCreateFlare" (ByVal texture As Integer) As Integer
  Declare Sub      iFlareScale Cdecl Alias "iFlareScale" (ByVal flare As Integer,Byval source As Single,Byval optics As Single)
  Declare Function iCreateGrass Cdecl Alias "iCreateGrass" (ByVal terrain As Integer,Byval x As Integer,Byval y As Integer,Byval patchSize As Integer,Byval fadeDistance As Single,Byval crossed As Integer,Byval grassScale As Single,Byval maxDensity As Integer,Byval dataPositionX As Integer,Byval dataPositionY As Integer,Byval heightMap As Integer,Byval textureMap As Integer,Byval grassMap As Integer,Byval grassTexture As Integer) As Integer
  Declare Sub      iGrassDensity Cdecl Alias "iGrassDensity" (ByVal grass As Integer,Byval density As Integer,Byval distance As Single)
  Declare Sub      iGrassWind Cdecl Alias "iGrassWind" (ByVal grass As Integer,Byval strength As Single,Byval resolution As Single)
  Declare Function iGrassDrawCount Cdecl Alias "iGrassDrawCount" (ByVal grass As Integer) As Integer
  Declare Function iCreateBolt Cdecl Alias "iCreateBolt" () As Integer
  Declare Sub      iBoltProperties Cdecl Alias "iBoltProperties" (ByVal bolt As Integer,Byval sx As Single,Byval sy As Single,Byval sz As Single,Byval ex As Single,Byval ey As Single,Byval ez As Single,Byval updateTime As Integer,Byval Height As Integer,Byval thickness As Single,Byval parts As Integer,Byval bolts As Integer,Byval steadyend As Integer,Byval r As Integer,Byval g As Integer,Byval b As Integer,Byval alpha2 As Integer)
  Declare Function iCreateBeam Cdecl Alias "iCreateBeam" () As Integer
  Declare Sub      iBeamSize Cdecl Alias "iBeamSize" (ByVal beam As Integer,Byval SIZE As Single)
  Declare Sub      iPositionBeam Cdecl Alias "iPositionBeam" (ByVal beam As Integer,Byval sx As Single,Byval sy As Single,Byval sz As Single,Byval ex As Single,Byval ey As Single,Byval ez As Single)
  Declare Function iCreatePivot Cdecl Alias "iCreatePivot" () As Integer
  Declare Function iCreateSkybox Cdecl Alias "iCreateSkybox" (ByVal up_texture As Integer,Byval down_texture As Integer,Byval left_texture As Integer,Byval right_texture As Integer,Byval front_texture As Integer,Byval back_texture As Integer) As Integer

  Declare Function iLinePick Cdecl Alias "iLinePick" (ByVal x As Single,Byval y As Single,Byval z As Single,Byval dx As Single,Byval dy As Single,Byval dz As Single) As Integer
  Declare Function iCameraPick Cdecl Alias "iCameraPick" (ByVal camera As Integer,Byval x As Integer,Byval y As Integer) As Integer
  Declare Function iPickedX Cdecl Alias "iPickedX" () As Single
  Declare Function iPickedY Cdecl Alias "iPickedY" () As Single
  Declare Function iPickedZ Cdecl Alias "iPickedZ" () As Single
  Declare Function iPickedNX Cdecl Alias "iPickedNX" () As Single
  Declare Function iPickedNY Cdecl Alias "iPickedNY" () As Single
  Declare Function iPickedNZ Cdecl Alias "iPickedNZ" () As Single

  Declare Sub      iScaleNode Cdecl Alias "iScaleNode" (ByVal node As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iPositionNode Cdecl Alias "iPositionNode" (ByVal node As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single)
  Declare Sub      iRotateNode Cdecl Alias "iRotateNode" (ByVal node As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iTurnNode Cdecl Alias "iTurnNode" (ByVal node As Integer,Byval pitch As Single,Byval yaw As Single,Byval roll As Single)
  Declare Sub      iMoveNode Cdecl Alias "iMoveNode" (ByVal node As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Function iNodeX Cdecl Alias "iNodeX" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodeY Cdecl Alias "iNodeY" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodeZ Cdecl Alias "iNodeZ" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodeRoll Cdecl Alias "iNodeRoll" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodeYaw Cdecl Alias "iNodeYaw" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodePitch Cdecl Alias "iNodePitch" (ByVal node As Integer,Byval global As Integer) As Single
  Declare Function iNodeClass Cdecl Alias "iNodeClass" (ByVal node As Integer) As Integer
  Declare Function iNodeName Cdecl Alias "iNodeName" (ByVal node As Integer) As String
  Declare Function iNodeID Cdecl Alias "iNodeID" (ByVal node As Integer) As Integer
  Declare Function iCountChildren Cdecl Alias "iCountChildren" (ByVal node As Integer) As Integer
  Declare Function iGetChild Cdecl Alias "iGetChild" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iNodeShadow Cdecl Alias "iNodeShadow" (ByVal node As Integer) As Integer
  Declare Function iRemoveNodeShadow Cdecl Alias "iRemoveNodeShadow" (ByVal node As Integer,Byval shadow As Integer) As Integer
  Declare Function iNodeDistance Cdecl Alias "iNodeDistance" (ByVal src_node As Integer,Byval dest_node As Integer) As Single
  Declare Sub      iDebugNode Cdecl Alias "iDebugNode" (ByVal node As Integer,Byval state As Integer)
  Declare Sub      iNodeMaterialFlag Cdecl Alias "iNodeMaterialFlag" (ByVal node As Integer,Byval flag As Integer,Byval value As Integer)
  Declare Sub      iNodeMaterialType Cdecl Alias "iNodeMaterialType" (ByVal node As Integer,Byval mat_type As Integer)
  Declare Function iGetNodeByID Cdecl Alias "iGetNodeByID" (ByVal id As Integer) As Integer
  Declare Function iGetNodeByName Cdecl Alias "iGetNodeByName" (ByVal Name As ZString Ptr) As Integer
  Declare Function iFreeNode Cdecl Alias "iFreeNode" (ByVal node As Integer) As Integer
  Declare Function iCopyNode Cdecl Alias "iCopyNode" (ByVal node As Integer,Byval parent As Integer) As Integer
  Declare Sub      iNodeTexture Cdecl Alias "iNodeTexture" (ByVal node As Integer,Byval texture As Integer,Byval index As Integer)
  Declare Sub      iNodeColor Cdecl Alias "iNodeColor" (ByVal node As Integer,Byval r As Integer,Byval g As Integer,Byval b As Integer,Byval alpha2 As Integer)
  Declare Sub      iNodealpha2 Cdecl Alias "iNodeAlpha" (ByVal node As Integer,Byval alpha2 As Integer)
  Declare Sub      iNameNode Cdecl Alias "iNameNode" (ByVal node As Integer,Byval Name As ZString Ptr)
  Declare Sub      iIDNode Cdecl Alias "iIDNode" (ByVal node As Integer,Byval id As Integer)
  Declare Sub      iNodeParent Cdecl Alias "iNodeParent" (ByVal node As Integer,Byval parent As Integer)
  Declare Function iGetParent Cdecl Alias "iGetParent" (ByVal node As Integer) As Integer
  Declare Sub      iShowNode Cdecl Alias "iShowNode" (ByVal node As Integer)
  Declare Sub      iHideNode Cdecl Alias "iHideNode" (ByVal node As Integer)
  Declare Function iNodeXScale Cdecl Alias "iNodeXScale" (ByVal node As Integer) As Single
  Declare Function iNodeYScale Cdecl Alias "iNodeYScale" (ByVal node As Integer) As Single
  Declare Function iNodeZScale Cdecl Alias "iNodeZScale" (ByVal node As Integer) As Single
  Declare Function iGetNodeJoint Cdecl Alias "iGetNodeJoint" (ByVal node As Integer,Byval joint_name As ZString Ptr) As Integer
  Declare Sub      iResetNode Cdecl Alias "iResetNode" (ByVal node As Integer)
  Declare Sub      iNodeRadius Cdecl Alias "iNodeRadius" (ByVal node As Integer,Byval x_raduis As Single,Byval y_radius As Single)
  Declare Sub      iNodeBox Cdecl Alias "iNodeBox" (ByVal node As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval Width2 As Single,Byval Height As Single,Byval depth As Single)
  Declare Sub      iNodeType Cdecl Alias "iNodeType" (ByVal node As Integer,Byval collision_type As Integer,Byval recursive As Integer)
  Declare Sub      iNodePickMode Cdecl Alias "iNodePickMode" (ByVal node As Integer,Byval pick_geometry As Integer,Byval obscurer As Integer)
  
  Declare Sub      iGetScreenXFrom3DPosition Cdecl Alias "iGetScreenXFrom3DPosition" (ByVal pos_x As Single,Byval pos_y As Single,Byval pos_z As Single)
  Declare Sub      iGetScreenYFrom3DPosition Cdecl Alias "iGetScreenYFrom3DPosition" (ByVal pos_x As Single,Byval pos_y As Single,Byval pos_z As Single)
  
  Declare Function i3DPositionXFromScreen Cdecl Alias "i3DPositionXFromScreen" (ByVal screenX As Integer,Byval screenY As Integer,Byval camera As Integer,Byval normalX As Single,Byval normalY As Single,Byval normalZ As Single,Byval distanceFromOrigin As Single) As Single
  Declare Function i3DPositionYFromScreen Cdecl Alias "i3DPositionYFromScreen" (ByVal screenX As Integer,Byval screenY As Integer,Byval camera As Integer,Byval normalX As Single,Byval normalY As Single,Byval normalZ As Single,Byval distanceFromOrigin As Single) As Single
  Declare Function i3DPositionZFromScreen Cdecl Alias "i3DPositionZFromScreen" (ByVal screenX As Integer,Byval screenY As Integer,Byval camera As Integer,Byval normalX As Single,Byval normalY As Single,Byval normalZ As Single,Byval distanceFromOrigin As Single) As Single
  
  Declare Function iNodeCollided Cdecl Alias "iNodeCollided" (ByVal node As Integer,Byval Type As Integer) As Integer
  Declare Function iCountCollisions Cdecl Alias "iCountCollisions" (ByVal node As Integer) As Integer
  Declare Function iCollisionX Cdecl Alias "iCollisionX" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionY Cdecl Alias "iCollisionY" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionZ Cdecl Alias "iCollisionZ" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionNX Cdecl Alias "iCollisionNX" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionNY Cdecl Alias "iCollisionNY" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionNZ Cdecl Alias "iCollisionNZ" (ByVal node As Integer,Byval index As Integer) As Single
  Declare Function iCollisionTime Cdecl Alias "iCollisionTime" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iCollisionNode Cdecl Alias "iCollisionNode" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iCollisionSurface Cdecl Alias "iCollisionSurface" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iCollisionTriangle Cdecl Alias "iCollisionTriangle" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iGetNodeType Cdecl Alias "iGetNodeType" (ByVal node As Integer) As Integer
  Declare Function iGetCollisionGroupFromMesh Cdecl Alias "iGetCollisionGroupFromMesh" (ByVal node As Integer,Byval frame As Integer) As Integer
  Declare Function iGetCollisionGroupFromComplexMesh Cdecl Alias "iGetCollisionGroupFromComplexMesh" (ByVal mesh As Integer,Byval node As Integer,Byval frame As Integer) As Integer
  Declare Function iGetCollisionGroupFromBox Cdecl Alias "iGetCollisionGroupFromBox" (ByVal node As Integer) As Integer
  Declare Function iGetCollisionGroupFromTerrain Cdecl Alias "iGetCollisionGroupFromTerrain" (ByVal node As Integer,Byval level_of_detail As Integer) As Integer
  Declare Sub      iAttachCollisionGroupToNode Cdecl Alias "iAttachCollisionGroupToNode" (ByVal collision As Integer,Byval node As Integer)
  Declare Sub      iRemoveCollisionGroup Cdecl Alias "iRemoveCollisionGroup" (ByVal collision As Integer,Byval node As Integer)
  Declare Sub      iSetNodeTriangleSelector Cdecl Alias "iSetNodeTriangleSelector" (ByVal node As Integer,Byval collision As Integer)
  Declare Function iCreateCombinedCollisionGroup Cdecl Alias "iCreateCombinedCollisionGroup" () As Integer
  Declare Sub      iAddCollisionGroupToCombination Cdecl Alias "iAddCollisionGroupToCombination" (ByVal combined_collision_group As Integer,Byval collision_group As Integer)
  Declare Sub      iRemoveAllCollisionGroupsFromCombination Cdecl Alias "iRemoveAllCollisionGroupsFromCombination" (ByVal combined_collision_group As Integer)
  Declare Sub      iRemoveCollisionGroupFromCombination Cdecl Alias "iRemoveCollisionGroupFromCombination" (ByVal combined_collision_group As Integer,Byval collision_group As Integer)
  Declare Function iGetCollisionPoint Cdecl Alias "iGetCollisionPoint" (ByVal start As Integer,Byval line_end As Integer,Byval collision_group As Integer,Byval collision_point As Integer) As Integer
  Declare Sub      iGetRayFromScreenCoordinates Cdecl Alias "iGetRayFromScreenCoordinates" (ByVal screen_x As Integer,Byval screen_y As Integer,Byval camera As Integer,Byval start As Integer,Byval line_end As Integer)
  Declare Function iGetCollisionNodeFromCamera Cdecl Alias "iGetCollisionNodeFromCamera" (ByVal camera As Integer) As Integer
  Declare Function iGetCollisionNodeFromRay Cdecl Alias "iGetCollisionNodeFromRay" (ByVal x As Single,Byval y As Single,Byval z As Single,Byval dx As Single,Byval dy As Single,Byval dz As Single) As Integer
  Declare Function iGetChildCollisionNodeFromRay Cdecl Alias "iGetChildCollisionNodeFromRay" (ByVal node As Integer,Byval idMask As Integer,Byval recurse As Integer,Byval start As Integer,Byval line_end As Integer) As Integer
  Declare Function iGetChildCollisionNodeFromPoint Cdecl Alias "iGetChildCollisionNodeFromPoint" (ByVal node As Integer,Byval idMask As Integer,Byval recurse As Integer,Byval Point As Integer) As Integer
  Declare Function iGetCollisionNodeFromScreenCoordinates Cdecl Alias "iGetCollisionNodeFromScreenCoordinates" (ByVal screen_x As Integer,Byval screen_y As Integer) As Integer
  Declare Function iGetCollisionNodeAndPointFromRay Cdecl Alias "iGetCollisionNodeAndPointFromRay" (ByVal sx As Single,Byval sy As Single,Byval sz As Single,Byval ex As Single,Byval ey As Single,Byval ez As Single,Byval id As Integer,Byval rootNode As Integer) As Integer
  Declare Sub      iGet2DPositionFromScreenCoordinates Cdecl Alias "iGet2DPositionFromScreenCoordinates" (ByVal screenx As Integer,Byval screeny As Integer,Byval x As Single,Byval y As Single,Byval camera As Integer)
  Declare Function iGetDistanceBetweenNodes Cdecl Alias "iGetDistanceBetweenNodes" (ByVal nodeA As Integer,Byval nodeB As Integer) As Single
  Declare Function iAreNodesIntersecting Cdecl Alias "iAreNodesIntersecting" (ByVal nodeA As Integer,Byval nodeB As Integer) As Integer
  Declare Function iIsPointInsideNode Cdecl Alias "iIsPointInsideNode" (ByVal nodeA As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single) As Integer

  Declare Sub      iSetupIrrSceneCollision Cdecl Alias "iSetupIrrSceneCollision" (ByVal camera As Integer)  
  Declare Sub      iGetCollisionResultPosition Cdecl Alias "iGetCollisionResultPosition" (ByVal selector As Integer,Byval ellipsoidX As Single,Byval ellipsoidY As Single,Byval ellipsoidZ As Single,Byval ellipsoidRadius As Single,Byval velX As Single,Byval velY As Single,Byval velZ As Single,Byval gravityX As Single,Byval gravityY As Single,Byval gravityZ As Single,Byval slideSpeed As Single)
  Declare Function iCollFalling Cdecl Alias "iCollFalling" () As Integer
  Declare Function iCollHitPositionX Cdecl Alias "iCollHitPositionX" () As Single
  Declare Function iCollHitPositionY Cdecl Alias "iCollHitPositionY" () As Single
  Declare Function iCollHitPositionZ Cdecl Alias "iCollHitPositionZ" () As Single
  Declare Function iCollNewPositionX Cdecl Alias "iCollNewPositionX" () As Single
  Declare Function iCollNewPositionY Cdecl Alias "iCollNewPositionY" () As Single
  Declare Function iCollNewPositionZ Cdecl Alias "iCollNewPositionZ" () As Single
  
  Declare Sub      iSetJointMode Cdecl Alias "iSetJointMode" (ByVal node As Integer,Byval mode As Integer)
  Declare Function iAddZipFile Cdecl Alias "iAddZipFile" (ByVal path As ZString Ptr,Byval ignore_case As Integer,Byval ignore_paths As Integer,Byval password As ZString Ptr) As Integer
  
  Declare Sub      iChangeWorkingDirectory Cdecl Alias "iChangeWorkingDirectory" (ByVal path As ZString Ptr)
  Declare Function iGetWorkingDirectory Cdecl Alias "iGetWorkingDirectory" () As String
  
  Declare Function iLoadOctreeMesh Cdecl Alias "iLoadOctreeMesh" (ByVal file As ZString Ptr) As Integer
  Declare Function iAddOctreeMeshNode Cdecl Alias "iAddOctreeMeshNode" (ByVal mesh As Integer) As Integer
  
  ' animator
  Declare Sub      iAnimateNode Cdecl Alias "iAnimateNode" (ByVal node As Integer,Byval mode As Integer,Byval speed As Single,Byval first_frame As Integer,Byval last_frame As Integer,Byval transition As Single)
  Declare Sub      iPlayMD2Animation Cdecl Alias "iPlayMD2Animation" (ByVal node As Integer,Byval sequence As Integer)
  Declare Sub      iLoopAnimation Cdecl Alias "iLoopAnimation" (ByVal node As Integer,Byval looped As Integer)
  Declare Sub      iAnimationLooped Cdecl Alias "iAnimationLooped" (ByVal node As Integer)
  Declare Sub      iAnimationSpeed Cdecl Alias "iAnimationSpeed" (ByVal node As Integer,Byval speed As Single)
  Declare Function iAnimationFrame Cdecl Alias "iAnimationFrame" (ByVal node As Integer) As Integer
  Declare Sub      iSetAnimationFrame Cdecl Alias "iSetAnimationFrame" (ByVal node As Integer,Byval frame As Single)
  Declare Sub      iTransitionTime Cdecl Alias "iTransitionTime" (ByVal node As Integer,Byval speed As Single)
  Declare Sub      iAnimateJoints Cdecl Alias "iAnimateJoints" (ByVal node As Integer)
  Declare Function iCollisionAnimator Cdecl Alias "iCollisionAnimator" (ByVal selector As Integer,Byval node As Integer,Byval radiusx As Single,Byval radiusy As Single,Byval radiusz As Single,Byval gravityx As Single,Byval gravityy As Single,Byval gravityz As Single,Byval offsetx As Single,Byval offsety As Single,Byval offsetz As Single) As Integer
  Declare Function iDeleteAnimator Cdecl Alias "iDeleteAnimator" (ByVal node As Integer,Byval delete_after_n_milliseconds As Integer) As Integer
  Declare Function iFlyCircleAnimator Cdecl Alias "iFlyCircleAnimator" (ByVal node As Integer,Byval centre_x As Single,Byval centre_y As Single,Byval centre_z As Single,Byval radius As Single,Byval speed As Single) As Integer
  Declare Function iFlyStraightAnimator Cdecl Alias "iFlyStraightAnimator" (ByVal node As Integer,Byval start_x As Single,Byval start_y As Single,Byval start_z As Single,Byval end_x As Single,Byval end_y As Single,Byval end_z As Single,Byval time_to_complete As Integer,Byval loop_path As Integer) As Integer
  Declare Function iRotationAnimator Cdecl Alias "iRotationAnimator" (ByVal node As Integer,Byval x As Single,Byval y As Single,Byval z As Single) As Integer
  Declare Function iSplineAnimator Cdecl Alias "iSplineAnimator" (ByVal node As Integer,Byval array_size As Integer,Byval x As Single ptr,Byval y As Single ptr,Byval z As Single ptr,Byval time_to_start As Integer,Byval speed As Single,Byval tightness As Single) As Integer
  Declare Function iFadeAnimator Cdecl Alias "iFadeAnimator" (ByVal node As Integer,Byval delete_after_n_milliseconds As Integer,Byval scale As Single) As Integer
  Declare Sub      iFreeAnimator Cdecl Alias "iFreeAnimator" (ByVal node As Integer,Byval animnode As Integer)
  
  
  Declare Function iCreateMesh Cdecl Alias "iCreateMesh" (ByVal mesh_name As ZString Ptr,Byval vertex_count As Integer,Byval vertices As Integer,Byval indices_count As Integer,Byval indices As Integer) As Integer
  Declare Function iWriteMesh Cdecl Alias "iWriteMesh" (ByVal mesh As Integer,Byval file_format As Integer,Byval path As ZString Ptr) As Integer
  Declare Sub      iClearUnusedMeshes Cdecl Alias "iClearUnusedMeshes" ()
  Declare Sub      iFreeMesh Cdecl Alias "iFreeMesh" (ByVal mesh As Integer)
  Declare Sub      iNameMesh Cdecl Alias "iNameMesh" (ByVal mesh As Integer,Byval newName As ZString Ptr)
  Declare Function iLoadMesh Cdecl Alias "iLoadMesh" (ByVal file As ZString Ptr) As Integer
  Declare Function iLoadMeshNode Cdecl Alias "iLoadMeshNode" (ByVal file As ZString Ptr,Byval parent As Integer) As Integer
  Declare Function iLoadAnimMesh Cdecl Alias "iLoadAnimMesh" (ByVal file As ZString Ptr,Byval parent As Integer) As Integer
  Declare Function iCreateCube Cdecl Alias "iCreateCube" (ByVal SIZE As Single,Byval parent As Integer) As Integer
  Declare Function iCreateSphere Cdecl Alias "iCreateSphere" (ByVal polycount As Integer,Byval parent As Integer) As Integer
  Declare Function iCopyMesh Cdecl Alias "iCopyMesh" (ByVal mesh As Integer) As Integer
  Declare Sub      iScaleMesh Cdecl Alias "iScaleMesh" (ByVal mesh As Integer,Byval scale As Single,Byval frame As Integer,Byval meshBuffer As Integer,Byval mesh2 As Integer)
  Declare Function iCreateHillPlaneMesh Cdecl Alias "iCreateHillPlaneMesh" (ByVal mesh_name As ZString Ptr,Byval tileSizeX As Single,Byval tileSizeY As Single,Byval tileCountX As Integer,Byval tileCountY As Integer,Byval material As Integer,Byval hillHeight As Single,Byval countHillsX As Single,Byval countHillsY As Single,Byval textureRepeatCountX As Single,Byval textureRepeatCountY As Single) As Integer
  Declare Function iFlipMesh Cdecl Alias "iFlipMesh" (ByVal mesh As Integer) As Integer
  Declare Function iFlipNodeMesh Cdecl Alias "iFlipNodeMesh" (ByVal node As Integer) As Integer
  Declare Sub      iHWAcceleratedMesh Cdecl Alias "iHWAcceleratedMesh" (ByVal mesh As Integer,Byval frame As Integer)
  Declare Sub      iHWAcceleratedMeshNode Cdecl Alias "iHWAcceleratedMeshNode" (ByVal node As Integer,Byval frame As Integer)
  Declare Function iGetNodeMesh Cdecl Alias "iGetNodeMesh" (ByVal node As Integer) As Integer
  Declare Function iAddMeshToScene Cdecl Alias "iAddMeshToScene" (ByVal mesh As Integer) As Integer
  Declare Function iCreateBatchingMesh Cdecl Alias "iCreateBatchingMesh" () As Integer
  Declare Sub      iAddToBatchingMesh Cdecl Alias "iAddToBatchingMesh" (ByVal meshBatch As Integer,Byval mesh As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single,Byval rotX As Single,Byval rotY As Single,Byval rotZ As Single,Byval scaleX As Single,Byval scaleY As Single,Byval scaleZ As Single)
  Declare Function iFinalizeBatchingMesh Cdecl Alias "iFinalizeBatchingMesh" (ByVal meshBatch As Integer) As Integer
  Declare Sub      iMeshTexture Cdecl Alias "iMeshTexture" (ByVal mesh As Integer,Byval texture As Integer,Byval material_index As Integer,Byval buffer As Integer)
  Declare Function iMeshFrameCount Cdecl Alias "iMeshFrameCount" (ByVal mesh As Integer) As Integer
  Declare Function iMeshBufferCount Cdecl Alias "iMeshBufferCount" (ByVal mesh As Integer,Byval frame As Integer) As Integer
  Declare Function iMeshIndexCount Cdecl Alias "iMeshIndexCount" (ByVal mesh As Integer,Byval frame As Integer,Byval meshBuffer As Integer) As Integer
  Declare Sub      iCopyMeshIndicesTo Cdecl Alias "iCopyMeshIndicesTo" (ByVal mesh As Integer,Byval frame As Integer,Byval indicies As Integer,Byval meshBuffer As Integer)
  Declare Sub      iCopyMeshIndicesFrom Cdecl Alias "iCopyMeshIndicesFrom" (ByVal mesh As Integer,Byval frame As Integer,Byval indicies As Integer,Byval meshBuffer As Integer)
  Declare Function iMeshVertexCount Cdecl Alias "iMeshVertexCount" (ByVal mesh As Integer,Byval frame As Integer,Byval meshBuffer As Integer) As Integer
  Declare Sub      iCopyMeshVerticesTo Cdecl Alias "iCopyMeshVerticesTo" (ByVal mesh As Integer,Byval frame As Integer,Byval verticies As Integer,Byval meshBuffer As Integer)
  Declare Sub      iCopyMeshVerticesFrom Cdecl Alias "iCopyMeshVerticesFrom" (ByVal mesh As Integer,Byval frame As Integer,Byval verticies As Integer,Byval meshBuffer As Integer)
  Declare Function iMeshVertexMemory Cdecl Alias "iMeshVertexMemory" (ByVal mesh As Integer,Byval frame As Integer,Byval meshBuffer As Integer) As Integer
  Declare Sub      iMeshVertexColors Cdecl Alias "iMeshVertexColors" (ByVal mesh As Integer,Byval frame As Integer,Byval vertexColor As Integer,Byval groupAmount As Integer,Byval startPos As Integer,Byval endPos As Integer,Byval meshbuffer As Integer)
  Declare Sub      iMeshVertexCoords Cdecl Alias "iMeshVertexCoords" (ByVal mesh As Integer,Byval frame As Integer,Byval vertexCoord As Integer,Byval groupAmount As Integer,Byval startPos As Integer,Byval endPos As Integer,Byval meshbuffer As Integer)
  Declare Sub      iMeshVertexSingleColor Cdecl Alias "iMeshVertexSingleColor" (ByVal mesh As Integer,Byval frame As Integer,Byval vertexColor As Integer,Byval groupAmount As Integer,Byval startPos As Integer,Byval endPos As Integer,Byval meshbuffer As Integer)
  Declare Sub      iMeshBoundingBox Cdecl Alias "iMeshBoundingBox" (ByVal mesh As Integer,Byval minX As Single,Byval minY As Single,Byval minZ As Single,Byval maxX As Single,Byval maxY As Single,Byval maxZ As Single)
  Declare Function iStaticMeshForNormalMapping Cdecl Alias "iStaticMeshForNormalMapping" (ByVal mesh As Integer) As Integer
  Declare Function iCreatePlane Cdecl Alias "iCreatePlane" (ByVal mesh_name As ZString Ptr) As Integer
  Declare Sub      iTextureCreateFlag Cdecl Alias "iTextureCreateFlag" (ByVal flag As Integer,Byval value As Integer)
  Declare Function iCreateTexture Cdecl Alias "iCreateTexture" (ByVal Name As ZString Ptr,Byval x As Integer,Byval y As Integer,Byval Format As Integer) As Integer
  Declare Function iLoadTexture Cdecl Alias "iLoadTexture" (ByVal file As ZString Ptr) As Integer
  Declare Function iCreateRenderTexture Cdecl Alias "iCreateRenderTexture" (ByVal x As Integer,Byval y As Integer) As Integer
  Declare Sub      iDrawSceneToTexture Cdecl Alias "iDrawSceneToTexture" (ByVal texture As Integer)
  Declare Sub      iRenderTargetTexture Cdecl Alias "iRenderTargetTexture" (ByVal texture As Integer,Byval sceneBackgroundColor As Integer,Byval clearBackBuffer As Integer,Byval clearZBuffer As Integer)
  Declare Sub      iFreeTexture Cdecl Alias "iFreeTexture" (ByVal texture As Integer)
  Declare Function iTextureBlend Cdecl Alias "iTextureBlend" (ByVal destination_texture As Integer,Byval source_texture As Integer,Byval x_offset As Integer,Byval y_offset As Integer,Byval operation As Integer) As Integer
  Declare Function iTextureWidth Cdecl Alias "iTextureWidth" (ByVal texture As Integer) As Integer
  Declare Function iTextureHeight Cdecl Alias "iTextureHeight" (ByVal texture As Integer) As Integer
  Declare Sub      iMaskTexture Cdecl Alias "iMaskTexture" (ByVal texture As Integer,Byval red As Integer,Byval green As Integer,Byval blue As Integer,Byval alpha2 As Integer)
  Declare Function iLockTexture Cdecl Alias "iLockTexture" (ByVal texture As Integer) As Integer
  Declare Sub      iUnlockTexture Cdecl Alias "iUnlockTexture" (ByVal texture As Integer)
  Declare Sub      iNormalMapTexture Cdecl Alias "iNormalMapTexture" (ByVal texture As Integer,Byval amplitude As Single)
  Declare Sub      iNodeAmbientColor Cdecl Alias "iNodeAmbientColor" (ByVal node As Integer,Byval uColor As Integer)
  Declare Sub      iNodeDiffuseColor Cdecl Alias "iNodeDiffuseColor" (ByVal node As Integer,Byval uColor As Integer)
  Declare Sub      iNodeSpecularColor Cdecl Alias "iNodeSpecularColor" (ByVal node As Integer,Byval uColor As Integer)
  Declare Sub      iNodeEmissiveColor Cdecl Alias "iNodeEmissiveColor" (ByVal node As Integer,Byval uColor As Integer)
  Declare Sub      iNodeColorByVertex Cdecl Alias "iNodeColorByVertex" (ByVal node As Integer,Byval colorMaterial As Integer)
  
  ' material
  Declare Sub      iMaterialVertexColorAffects Cdecl Alias "iMaterialVertexColorAffects" (ByVal material As Integer,Byval colorMaterial As Integer)
  Declare Sub      iMaterialShininess Cdecl Alias "iMaterialShininess" (ByVal material As Integer,Byval shininess As Single)
  Declare Sub      iMaterialSpecularColor Cdecl Alias "iMaterialSpecularColor" (ByVal material As Integer,Byval alpha2 As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iMaterialDiffuseColor Cdecl Alias "iMaterialDiffuseColor" (ByVal material As Integer,Byval alpha2 As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iMaterialAmbientColor Cdecl Alias "iMaterialAmbientColor" (ByVal material As Integer,Byval alpha2 As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iMaterialEmissiveColor Cdecl Alias "iMaterialEmissiveColor" (ByVal material As Integer,Byval alpha2 As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iMaterialTypeParam Cdecl Alias "iMaterialTypeParam" (ByVal material As Integer,Byval value As Single)
  Declare Sub      iMaterialBlend Cdecl Alias "iMaterialBlend" (ByVal material As Integer,Byval blendSrc As Integer,Byval blendDest As Integer)
  Declare Sub      iMaterialLineThickness Cdecl Alias "iMaterialLineThickness" (ByVal material As Integer,Byval value As Single)
  
  
  Declare Function iCreateNamedVertexShaderConstant Cdecl Alias "iCreateNamedVertexShaderConstant" (ByVal shader As Integer,Byval const_name As ZString Ptr,Byval const_preset As Integer,Byval const_data As Single,Byval data_count As Integer) As Integer
  Declare Function iCreateNamedPixelShaderConstant Cdecl Alias "iCreateNamedPixelShaderConstant" (ByVal shader As Integer,Byval const_name As ZString Ptr,Byval const_preset As Integer,Byval const_data As Single,Byval data_count As Integer) As Integer
  Declare Function iCreateAddressedVertexShaderConstant Cdecl Alias "iCreateAddressedVertexShaderConstant" (ByVal shader As Integer,Byval const_address As Integer,Byval const_preset As Integer,Byval const_data As Single,Byval data_count As Integer) As Integer
  Declare Function iCreateAddressedPixelShaderConstant Cdecl Alias "iCreateAddressedPixelShaderConstant" (ByVal shader As Integer,Byval const_address As Integer,Byval const_preset As Integer,Byval const_data As Single,Byval data_count As Integer) As Integer
  Declare Function iAddHighLevelShaderMaterial Cdecl Alias "iAddHighLevelShaderMaterial" (ByVal vertex_program As ZString Ptr,Byval vertex_start_function As ZString Ptr,Byval vertex_prog_type As Integer,Byval pixel_program As ZString Ptr,Byval pixel_start_function As ZString Ptr,Byval pixel_prog_type As Integer,Byval material_type As Integer) As Integer
  Declare Function iAddHighLevelShaderMaterialFromFiles Cdecl Alias "iAddHighLevelShaderMaterialFromFiles" (ByVal vertex_program_filename As ZString Ptr,Byval vertex_start_function As ZString Ptr,Byval vertex_prog_type As Integer,Byval pixel_program_filename As ZString Ptr,Byval pixel_start_function As ZString Ptr,Byval pixel_prog_type As Integer,Byval material_type As Integer) As Integer
  Declare Function iAddShaderMaterial Cdecl Alias "iAddShaderMaterial" (ByVal vertex_program As ZString Ptr,Byval pixel_program As ZString Ptr,Byval material_type As Integer) As Integer
  Declare Function iAddShaderMaterialFromFiles Cdecl Alias "iAddShaderMaterialFromFiles" (ByVal vertex_program_filename As ZString Ptr,Byval pixel_program_filename As ZString Ptr,Byval material_type As Integer) As Integer
  Declare Function itMaterialCount Cdecl Alias "itMaterialCount" (ByVal node As Integer) As Integer
  Declare Function iGetMaterial Cdecl Alias "iGetMaterial" (ByVal node As Integer,Byval index As Integer) As Integer
  Declare Function iLoadImage Cdecl Alias "iLoadImage" (ByVal path As ZString Ptr) As Integer
  Declare Function iCreateImage Cdecl Alias "iCreateImage" (ByVal x As Integer,Byval y As Integer,Byval Format As Integer) As Integer
  Declare Sub      iFreeImage Cdecl Alias "iFreeImage" (ByVal Imagen As Integer)
  Declare Function iLockImage Cdecl Alias "iLockImage" (ByVal Imagen As Integer) As Integer
  Declare Sub      iUnlockImage Cdecl Alias "iUnlockImage" (ByVal Imagen As Integer)
  Declare Sub      iSaveScreenShot Cdecl Alias "iSaveScreenShot" (ByVal text As ZString Ptr)
  Declare Function iGrabScreenShot Cdecl Alias "iGrabScreenShot" (ByVal x As Integer,Byval y As Integer,Byval w As Integer,Byval h As Integer) As Integer
  Declare Function iImageWidth Cdecl Alias "iImageWidth" (ByVal Imagen As Integer) As Integer
  Declare Function iImageHeight Cdecl Alias "iImageHeight" (ByVal Imagen As Integer) As Integer
  Declare Function iImagePitch Cdecl Alias "iImagePitch" (ByVal Imagen As Integer) As Integer
  Declare Function iImageFormat Cdecl Alias "iImageFormat" (ByVal Imagen As Integer) As Integer
  Declare Sub      iDrawImage Cdecl Alias "iDrawImage" (ByVal texture As Integer,Byval x As Integer,Byval y As Integer)
  Declare Sub      iDrawImageElement Cdecl Alias "iDrawImageElement" (ByVal texture As Integer,Byval x As Integer,Byval y As Integer,Byval source_tx As Integer,Byval source_ty As Integer,Byval source_bx As Integer,Byval source_by As Integer,Byval usealpha2 As Integer)
  
  
  ' camera
  Declare Sub      iDrawImageElementScale Cdecl Alias "iDrawImageElementScale" (ByVal texture As Integer,Byval dest_tx As Integer,Byval dest_ty As Integer,Byval dest_bx As Integer,Byval dest_by As Integer,Byval source_tx As Integer,Byval source_ty As Integer,Byval source_bx As Integer,Byval source_by As Integer,Byval usealpha2 As Integer)
  Declare Function iCreateFPSCamera Cdecl Alias "iCreateFPSCamera" (ByVal parent As Integer,Byval rotateSpeed As Single,Byval moveSpeed As Single,Byval id As Integer,Byval keyMapArray As Integer,Byval keyMapSize As Integer,Byval noVerticalMovement As Integer,Byval jumpSpeed As Single) As Integer
  Declare Function iCreateCamera Cdecl Alias "iCreateCamera" (ByVal parent As Integer) As Integer
  Declare Function iCreateMayaCamera Cdecl Alias "iCreateMayaCamera" (ByVal parent As Integer,Byval rotateSpeed As Single,Byval zoomSpeed As Single,Byval moveSpeed As Single) As Integer
  Declare Sub      iCameraTarget Cdecl Alias "iCameraTarget" (ByVal camera As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single)
  Declare Function iCameraTargetX Cdecl Alias "iCameraTargetX" (ByVal camera As Integer) As Single
  Declare Function iCameraTargetY Cdecl Alias "iCameraTargetY" (ByVal camera As Integer) As Single
  Declare Function iCameraTargetZ Cdecl Alias "iCameraTargetZ" (ByVal camera As Integer) As Single
  Declare Function iCameraUpX Cdecl Alias "iCameraUpX" (ByVal camera As Integer) As Single
  Declare Function iCameraUpY Cdecl Alias "iCameraUpY" (ByVal camera As Integer) As Single
  Declare Function iCameraUpZ Cdecl Alias "iCameraUpZ" (ByVal camera As Integer) As Single
  Declare Sub      iCameraUp Cdecl Alias "iCameraUp" (ByVal camera As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single)
  Declare Function iCameraForwardX Cdecl Alias "iCameraForwardX" (ByVal camera As Integer) As Single
  Declare Function iCameraForwardY Cdecl Alias "iCameraForwardY" (ByVal camera As Integer) As Single
  Declare Function iCameraForwardZ Cdecl Alias "iCameraForwardZ" (ByVal camera As Integer) As Single
  Declare Function iCameraRightX Cdecl Alias "iCameraRightX" (ByVal camera As Integer) As Single
  Declare Function iCameraRightY Cdecl Alias "iCameraRightY" (ByVal camera As Integer) As Single
  Declare Function iCameraRightZ Cdecl Alias "iCameraRightZ" (ByVal camera As Integer) As Single
  Declare Sub      iCameraRange Cdecl Alias "iCameraRange" (ByVal camera As Integer,Byval farDistance As Single,Byval nearDistance As Single)
  Declare Sub      iActiveCamera Cdecl Alias "iActiveCamera" (ByVal camera As Integer)
  Declare Sub      iCameraFOV Cdecl Alias "iCameraFOV" (ByVal camera As Integer,Byval fov As Single)
  Declare Sub      iCameraAspectRatio Cdecl Alias "iCameraAspectRatio" (ByVal camera As Integer,Byval aspectRatio As Single)
  
  
  ' terrain
  Declare Function iLoadTerrain Cdecl Alias "iLoadTerrain" (ByVal path As ZString Ptr,Byval xPosition As Single,Byval yPosition As Single,Byval zPosition As Single,Byval xRotation As Single,Byval yRotation As Single,Byval zRotation As Single,Byval xScale As Single,Byval yScale As Single,Byval zScale As Single,Byval vertexalpha2 As Integer,Byval vertexRed As Integer,Byval vertexGreen As Integer,Byval vertexBlue As Integer,Byval smoothing As Integer,Byval maxLOD As Integer,Byval patchSize As Integer) As Integer
  Declare Function iCreateTiledTerrain Cdecl Alias "iCreateTiledTerrain" (ByVal heightMapPath As ZString Ptr,Byval texturePath As ZString Ptr,Byval followNode As Integer,Byval terrainWidth As Integer,Byval terrainHeight As Integer,Byval tileSize As Single,Byval meshSize As Integer,Byval heightmapScale As Single,Byval smoothing As Integer,Byval materialType As Integer) As Integer
  Declare Function iTiledTerrainHeight Cdecl Alias "iTiledTerrainHeight" (ByVal terrain As Integer,Byval X As Single,Byval Z As Single) As Single
  Declare Function iTerrainHeight Cdecl Alias "iTerrainHeight" (ByVal terrain As Integer,Byval X As Single,Byval Z As Single) As Single
  Declare Sub      iScaleTerrainTexture Cdecl Alias "iScaleTerrainTexture" (ByVal terrain As Integer,Byval X As Single,Byval Y As Single)
  Declare Sub      iScaleSphericalTexture Cdecl Alias "iScaleSphericalTexture" (ByVal terrain As Integer,Byval X As Single,Byval Y As Single)
  Declare Sub      iScaleTileTexture Cdecl Alias "iScaleTileTexture" (ByVal terrain As Integer,Byval X As Single,Byval Y As Single)
  Declare Sub      iAttachTile Cdecl Alias "iAttachTile" (ByVal terrain As Integer,Byval neighbour As Integer,Byval Edge As Integer)
  Declare Sub      iLoadTileStructure Cdecl Alias "iLoadTileStructure" (ByVal terrain As Integer,Byval Imagen As Integer,Byval dataX As Integer,Byval dataY As Integer)
  Declare Sub      iLoadTileColor Cdecl Alias "iLoadTileColor" (ByVal terrain As Integer,Byval Imagen As Integer,Byval dataX As Integer,Byval dataY As Integer)
  Declare Function iCreateSphericalTerrain Cdecl Alias "iCreateSphericalTerrain" (ByVal topPath As ZString Ptr,Byval frontPath As ZString Ptr,Byval backPath As ZString Ptr,Byval leftPath As ZString Ptr,Byval rightPath As ZString Ptr,Byval bottomPath As ZString Ptr,Byval xPosition As Single,Byval yPosition As Single,Byval zPosition As Single,Byval xRotation As Single,Byval yRotation As Single,Byval zRotation As Single,Byval xScale As Single,Byval yScale As Single,Byval zScale As Single,Byval vertexalpha2 As Integer,Byval vertexRed As Integer,Byval vertexGreen As Integer,Byval vertexBlue As Integer,Byval smoothing As Integer,Byval spherical As Integer,Byval maxLOD As Integer,Byval patchSize As Integer) As Integer
  Declare Sub      iSphericalTerrainTexture Cdecl Alias "iSphericalTerrainTexture" (ByVal terrain As Integer,Byval topTexture As Integer,Byval frontTexture As Integer,Byval backTexture As Integer,Byval leftTexture As Integer,Byval rightTexture As Integer,Byval bottomTexture As Integer,Byval materialIndex As Integer)
  Declare Sub      iSphericalTerrainVertexColor Cdecl Alias "iSphericalTerrainVertexColor" (ByVal terrain As Integer,Byval topImagen As Integer,Byval frontImagen As Integer,Byval backImagen As Integer,Byval leftImagen As Integer,Byval rightImagen As Integer,Byval bottomImagen As Integer)
  Declare Function iSphericalTerrainSurfaceX Cdecl Alias "iSphericalTerrainSurfaceX" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalTerrainSurfaceY Cdecl Alias "iSphericalTerrainSurfaceY" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalTerrainSurfaceZ Cdecl Alias "iSphericalTerrainSurfaceZ" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalTerrainAngleRX Cdecl Alias "iSphericalTerrainAngleRX" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalTerrainAngleRY Cdecl Alias "iSphericalTerrainAngleRY" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalTerrainAngleRZ Cdecl Alias "iSphericalTerrainAngleRZ" (ByVal terrain As Integer,Byval face As Integer,Byval logicalX As Single,Byval logicalZ As Single) As Single
  Declare Function iSphericalSurfaceLogicalX Cdecl Alias "iSphericalSurfaceLogicalX" (ByVal terrain As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single,Byval face As Integer) As Single
  Declare Function iSphericalSurfaceLogicalZ Cdecl Alias "iSphericalSurfaceLogicalZ" (ByVal terrain As Integer,Byval X As Single,Byval Y As Single,Byval Z As Single,Byval face As Integer) As Single
  
  
  ' light
  Declare Function iCreateLight Cdecl Alias "iCreateLight" (ByVal parent As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval red As Single,Byval green As Single,Byval blue As Single,Byval SIZE As Single) As Integer
  Declare Sub      iLightAmbientColor Cdecl Alias "iLightAmbientColor" (ByVal light As Integer,Byval R As Single,Byval G As Single,Byval B As Single)
  Declare Sub      iLightDiffuseColor Cdecl Alias "iLightDiffuseColor" (ByVal light As Integer,Byval R As Single,Byval G As Single,Byval B As Single)
  Declare Sub      iLightRange Cdecl Alias "iLightRange" (ByVal light As Integer,Byval constant As Single,Byval linear As Single,Byval quadratic As Single)
  Declare Sub      iLightCastShadows Cdecl Alias "iLightCastShadows" (ByVal light As Integer,Byval cast_shadows As Integer)
  Declare Sub      iLightFalloff Cdecl Alias "iLightFalloff" (ByVal light As Integer,Byval Falloff As Single)
  Declare Sub      iLightConeAngle Cdecl Alias "iLightConeAngle" (ByVal light As Integer,Byval InnerCone As Single,Byval OuterCone As Single)
  Declare Sub      iLightRadius Cdecl Alias "iLightRadius" (ByVal light As Integer,Byval Radius As Single)
  Declare Sub      iLightSpecularColor Cdecl Alias "iLightSpecularColor" (ByVal light As Integer,Byval R As Single,Byval G As Single,Byval B As Single)
  Declare Sub      iLightType Cdecl Alias "iLightType" (ByVal light As Integer,Byval light_type As Integer)
  
  
  
  ' particle
  Declare Function iCreateParticleSystem Cdecl Alias "iCreateParticleSystem" (ByVal add_emitter As Integer,Byval parent As Integer,Byval id As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single,Byval rotX As Single,Byval rotY As Single,Byval rotZ As Single,Byval scaleX As Single,Byval scaleY As Single,Byval scaleZ As Single) As Integer
  Declare Sub      iParticleSize Cdecl Alias "iParticleSize" (ByVal particle_emitter As Integer,Byval X As Single,Byval Y As Single)
  Declare Sub      iParticleMinSize Cdecl Alias "iParticleMinSize" (ByVal particle_emitter As Integer,Byval X As Single,Byval Y As Single)
  Declare Sub      iParticleMaxSize Cdecl Alias "iParticleMaxSize" (ByVal particle_emitter As Integer,Byval X As Single,Byval Y As Single)
  Declare Function iCreateParticleEmitter Cdecl Alias "iCreateParticleEmitter" (ByVal particle_system As Integer,Byval min_box_x As Single,Byval min_box_y As Single,Byval min_box_z As Single,Byval max_box_x As Single,Byval max_box_y As Single,Byval max_box_z As Single,Byval dir_x As Single,Byval dir_y As Single,Byval dir_z As Single,Byval min_paritlcles_ps As Integer,Byval max_paritlcles_ps As Integer,Byval min_start_red As Integer,Byval min_start_green As Integer,Byval min_start_blue As Integer,Byval max_start_red As Integer,Byval max_start_green As Integer,Byval max_start_blue As Integer,Byval min_lifetime As Integer,Byval max_lifetime As Integer,Byval min_start_sizeX As Single,Byval min_start_sizeY As Single,Byval max_start_sizeX As Single,Byval max_start_sizeY As Single,Byval max_angle_degrees As Integer) As Integer
  Declare Function iCreateAnimatedMeshSceneNodeEmitter Cdecl Alias "iCreateAnimatedMeshSceneNodeEmitter" (ByVal particle_system As Integer,Byval node As Integer,Byval use_normal_direction As Integer,Byval normal_direction_modifier As Single,Byval emit_from_every_vertex As Integer,Byval settings As Integer) As Integer
  Declare Function iFadeOutAffector Cdecl Alias "iFadeOutAffector" (ByVal particle_system As Integer,Byval fade_speed As Integer,Byval fade_to_red As Integer,Byval fade_to_green As Integer,Byval fade_to_blue As Integer) As Integer
  Declare Function iGravityAffector Cdecl Alias "iGravityAffector" (ByVal particle_system As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval timeForceLost As Integer) As Integer
  Declare Function iAttractionAffector Cdecl Alias "iAttractionAffector" (ByVal particle_system As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval speed As Single,Byval attract As Integer,Byval affectX As Integer,Byval affectY As Integer,Byval affectZ As Integer) As Integer
  Declare Function iRotationAffector Cdecl Alias "iRotationAffector" (ByVal particle_system As Integer,Byval Speed_X As Single,Byval Speed_Y As Single,Byval Speed_Z As Single,Byval pivot_X As Single,Byval pivot_Y As Single,Byval pivot_Z As Single) As Integer
  Declare Function iStopAffector Cdecl Alias "iStopAffector" (ByVal particle_system As Integer,Byval run_time As Integer,Byval target_emitter As Integer) As Integer
  Declare Function iPushAffector Cdecl Alias "iPushAffector" (ByVal particle_system As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval speedX As Single,Byval speedY As Single,Byval speedZ As Single,Byval far As Single,Byval near As Single,Byval column As Single,Byval radial As Integer) As Integer
  Declare Function iColorAffector Cdecl Alias "iColorAffector" (ByVal particle_system As Integer,Byval num As Integer,Byval colors As Integer Ptr,Byval times As Integer Ptr,Byval smooth As Integer) As Integer
  Declare Function iSplineAffector Cdecl Alias "iSplineAffector" (ByVal particle_system As Integer,Byval VertexCount As Integer,Byval verticies As Integer Ptr,Byval speed As Single,Byval tightness As Single,Byval attraction As Single,Byval deleteAtEnd As Integer) As Integer
  Declare Sub      iFreeAffectors Cdecl Alias "iFreeAffectors" (ByVal particle_system As Integer)
  Declare Sub      iParticleEmitterDirection Cdecl Alias "iParticleEmitterDirection" (ByVal particle_system As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iEmitterMinParticlesPerSecond Cdecl Alias "iEmitterMinParticlesPerSecond" (ByVal particle_system As Integer,Byval minPPS As Integer)
  Declare Sub      iEmitterMaxParticlesPerSecond Cdecl Alias "iEmitterMaxParticlesPerSecond" (ByVal particle_system As Integer,Byval maxPPS As Integer)
  Declare Sub      iEmitterMinStartColor Cdecl Alias "iEmitterMinStartColor" (ByVal particle_system As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iEmitterMaxStartColor Cdecl Alias "iEmitterMaxStartColor" (ByVal particle_system As Integer,Byval Red As Integer,Byval Green As Integer,Byval Blue As Integer)
  Declare Sub      iParticleAffectorEnable Cdecl Alias "iParticleAffectorEnable" (ByVal affector As Integer,Byval enable As Integer)
  Declare Sub      iFadeOutParticleAffectorTime Cdecl Alias "iFadeOutParticleAffectorTime" (ByVal affector As Integer,Byval fade_speed As Integer)
  Declare Sub      iFadeOutParticleAffectorTargetColor Cdecl Alias "iFadeOutParticleAffectorTargetColor" (ByVal affector As Integer,Byval fade_to_red As Integer,Byval fade_to_green As Integer,Byval fade_to_blue As Integer)
  '
  Declare Sub      iGravityParticleAffectorDirection Cdecl Alias "iGravityParticleAffectorDirection" (ByVal affector As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iGravityParticleAffectorTimeForceLost Cdecl Alias "iGravityParticleAffectorTimeForceLost" (ByVal affector As Integer,Byval time_Force_Lost As Single)
  '
  Declare Sub      iParticleAttractionAffectorAffectX Cdecl Alias "iParticleAttractionAffectorAffectX" (ByVal affector As Integer,Byval affect_x As Integer)
  Declare Sub      iParticleAttractionAffectorAffectY Cdecl Alias "iParticleAttractionAffectorAffectY" (ByVal affector As Integer,Byval affect_y As Integer)
  Declare Sub      iParticleAttractionAffectorAffectZ Cdecl Alias "iParticleAttractionAffectorAffectZ" (ByVal affector As Integer,Byval affect_z As Integer)
  Declare Sub      iParticleAttractionAffectorAttract Cdecl Alias "iParticleAttractionAffectorAttract" (ByVal affector As Integer,Byval attract As Integer)
  Declare Sub      iParticleAttractionAffectorPoint Cdecl Alias "iParticleAttractionAffectorPoint" (ByVal affector As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  '
  Declare Sub      iRotationAffectorPivotPoint Cdecl Alias "iRotationAffectorPivotPoint" (ByVal affector As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iFurthestDistanceOfEffect Cdecl Alias "iFurthestDistanceOfEffect" (ByVal affector As Integer,Byval NewDistance As Single)
  Declare Sub      iNearestDistanceOfEffect Cdecl Alias "iNearestDistanceOfEffect" (ByVal affector As Integer,Byval NewDistance As Single)
  Declare Sub      iColumnDistanceOfEffect Cdecl Alias "iColumnDistanceOfEffect" (ByVal affector As Integer,Byval NewDistance As Single)
  Declare Sub      iCenterOfEffect Cdecl Alias "iCenterOfEffect" (ByVal affector As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iStrengthOfEffect Cdecl Alias "iStrengthOfEffect" (ByVal affector As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  
  
  
  Declare Function iCreateBillBoardGroup Cdecl Alias "iCreateBillBoardGroup" () As Integer
  Declare Function iBillBoardToGroup Cdecl Alias "iBillBoardToGroup" (ByVal group As Integer,Byval sizex As Single,Byval sizey As Single,Byval x As Single,Byval y As Single,Byval z As Single,Byval roll As Single,Byval A As Integer,Byval R As Integer,Byval G As Integer,Byval B As Integer) As Integer
  Declare Function iBillBoardByAxisToGroup Cdecl Alias "iBillBoardByAxisToGroup" (ByVal group As Integer,Byval sizex As Single,Byval sizey As Single,Byval x As Single,Byval y As Single,Byval z As Single,Byval roll As Single,Byval A As Integer,Byval R As Integer,Byval G As Integer,Byval B As Integer,Byval axis_x As Single,Byval axis_y As Single,Byval axis_z As Single) As Integer
  Declare Sub      iFreeBillBoardFromGroup Cdecl Alias "iFreeBillBoardFromGroup" (ByVal node As Integer,Byval billboard As Integer)
  Declare Sub      iBillBoardGroupShadows Cdecl Alias "iBillBoardGroupShadows" (ByVal group As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval intensity As Single,Byval ambient As Single)
  Declare Function iBillBoardGroupCount Cdecl Alias "iBillBoardGroupCount" (ByVal group As Integer) As Integer
  Declare Sub      iBillBoardForceUpdate Cdecl Alias "iBillBoardForceUpdate" (ByVal group As Integer)
  Declare Function iCreateBillBoard Cdecl Alias "iCreateBillBoard" (ByVal sizex As Single,Byval sizey As Single,Byval x As Single,Byval y As Single,Byval z As Single) As Integer
  Declare Sub      iBillBoardColor Cdecl Alias "iBillBoardColor" (ByVal node As Integer,Byval topColor As Integer,Byval bottomColor As Integer)
  Declare Sub      iBillBoardSize Cdecl Alias "iBillBoardSize" (ByVal node As Integer,Byval BillWidth As Single,Byval BillHeight As Single)
  Declare Function iCreateTextBillBoard Cdecl Alias "iCreateTextBillBoard" (ByVal font As Integer,Byval text As ZString Ptr,Byval sizex As Single,Byval sizey As Single,Byval x As Single,Byval y As Single,Byval z As Single,Byval parent As Integer,Byval topRGBA As Integer,Byval bottomRGBA As Integer) As Integer
  
  Declare Function iCreateZoneMgr Cdecl Alias "iCreateZoneMgr" (ByVal nearDistance As Single,Byval farDistance As Single) As Integer
  Declare Sub      iZoneMgrProperties Cdecl Alias "iZoneMgrProperties" (ByVal zoneNode As Integer,Byval nearDistance As Single,Byval farDistance As Single,Byval accumulateChildBoxes As Integer)
  Declare Sub      iZoneMgrBndBox Cdecl Alias "iZoneMgrBndBox" (ByVal zoneNode As Integer,Byval x As Single,Byval y As Single,Byval z As Single,Byval boxWidth As Single,Byval boxHeight As Single,Byval boxDepth As Single)
  Declare Sub      iZoneMgrAttachTerrain Cdecl Alias "iZoneMgrAttachTerrain" (ByVal zoneNode As Integer,Byval terrain As Integer,Byval structureMapFile As ZString Ptr,Byval colorMapFile As ZString Ptr,Byval detailMapFile As ZString Ptr,Byval ImageX As Integer,Byval ImageY As Integer,Byval sliceSize As Integer)
  Declare Function iCreateLODMgr Cdecl Alias "iCreateLODMgr" (ByVal fadeScale As Integer,Byval usealpha2 As Integer,Byval CALLBACK As Integer) As Integer
  Declare Sub      iLODMesh Cdecl Alias "iLODMesh" (ByVal node As Integer,Byval distance As Single,Byval mesh As Integer)
  Declare Sub      iLODMaterialMap Cdecl Alias "iLODMaterialMap" (ByVal node As Integer,Byval source As Integer,Byval Target As Integer)
  
  Declare Sub      iXFXStart Cdecl Alias "iXFXStart" (ByVal vsm As Integer,Byval softShadows As Integer,Byval bitdepth32 As Integer)
  Declare Sub      iXFXEnableDepthPass Cdecl Alias "iXFXEnableDepthPass" (ByVal enable As Integer)
  Declare Sub      iXFXAddPostProcessingFromFile Cdecl Alias "iXFXAddPostProcessingFromFile" (ByVal Name As ZString Ptr,Byval effectType As Integer)
  Declare Sub      iXFXSetPostProcessingUserTexture Cdecl Alias "iXFXSetPostProcessingUserTexture" (ByVal texture As Integer)
  Declare Sub      iXFXAddShadowToNode Cdecl Alias "iXFXAddShadowToNode" (ByVal node As Integer,Byval filterType As Integer,Byval shadowType As Integer)
  Declare Sub      iXFXRemoveShadowFromNode Cdecl Alias "iXFXRemoveShadowFromNode" (ByVal node As Integer)
  Declare Sub      iXFXExcludeNodeFromLightingCalculations Cdecl Alias "iXFXExcludeNodeFromLightingCalculations" (ByVal node As Integer)
  Declare Sub      iXFXAddNodeToDepthPass Cdecl Alias "iXFXAddNodeToDepthPass" (ByVal node As Integer)
  Declare Sub      iXFXSetAmbientColor Cdecl Alias "iXFXSetAmbientColor" (ByVal R As Integer,Byval G As Integer,Byval B As Integer,Byval alpha2 As Integer)
  Declare Sub      iXFXSetClearColor Cdecl Alias "iXFXSetClearColor" (ByVal R As Integer,Byval G As Integer,Byval B As Integer,Byval alpha2 As Integer)
  Declare Sub      iXFXAddShadowLight Cdecl Alias "iXFXAddShadowLight" (ByVal shadowDimen As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single,Byval targetX As Single,Byval targetY As Single,Byval targetZ As Single,Byval R As Single,Byval G As Single,Byval B As Single,Byval alpha2 As Single,Byval lightNearDist As Single,Byval lightFarDist As Single,Byval angleDegrees As Single)
  Declare Sub      iXFXSetShadowLightPosition Cdecl Alias "iXFXSetShadowLightPosition" (ByVal index As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single)
  Declare Function iXFXGetShadowLightPositionX Cdecl Alias "iXFXGetShadowLightPositionX" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightPositionY Cdecl Alias "iXFXGetShadowLightPositionY" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightPositionZ Cdecl Alias "iXFXGetShadowLightPositionZ" (ByVal index As Integer) As Single
  Declare Sub      iXFXSetShadowLightTarget Cdecl Alias "iXFXSetShadowLightTarget" (ByVal index As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single)
  Declare Sub      iXEffectsGetShadowLightTarget Cdecl Alias "iXEffectsGetShadowLightTarget" (ByVal index As Integer,Byval posX As Single,Byval posY As Single,Byval posZ As Single)
  Declare Function iXFXGetShadowLightTargetX Cdecl Alias "iXFXGetShadowLightTargetX" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightTargetY Cdecl Alias "iXFXGetShadowLightTargetY" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightTargetZ Cdecl Alias "iXFXGetShadowLightTargetZ" (ByVal index As Integer) As Single
  Declare Sub      iXFXSetShadowLightColor Cdecl Alias "iXFXSetShadowLightColor" (ByVal index As Integer,Byval R As Single,Byval G As Single,Byval B As Single,Byval alpha2 As Single)
  Declare Function iXFXGetShadowLightColorRed Cdecl Alias "iXFXGetShadowLightColorRed" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightColorGrn Cdecl Alias "iXFXGetShadowLightColorGrn" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightColorBlu Cdecl Alias "iXFXGetShadowLightColorBlu" (ByVal index As Integer) As Single
  Declare Function iXFXGetShadowLightColoralpha2 Cdecl Alias "iXFXGetShadowLightColorAlpha" (ByVal index As Integer) As Single
  
  ' GUI
  Declare Sub      iDrawGUI Cdecl Alias "iDrawGUI" ()
  Declare Sub      iReadGUIEvent Cdecl Alias "iReadGUIEvent" ()
  Declare Sub      iGUISetFont Cdecl Alias "iGUISetFont" (ByVal font As Integer)
  Declare Sub      iGUISetColor Cdecl Alias "iGUISetColor" (ByVal color_element As Integer,Byval r As Integer,Byval g As Integer,Byval b As Integer,Byval alpha2 As Integer)
  Declare Sub      iGUIClear Cdecl Alias "iGUIClear" ()
  Declare Sub      iGUIRemove Cdecl Alias "iGUIRemove" (ByVal gui_element As Integer)
  Declare Function iGUIGetText Cdecl Alias "iGUIGetText" (ByVal gui_element As Integer) As String
  Declare Sub      iGUISetText Cdecl Alias "iGUISetText" (ByVal gui_element As Integer,Byval text As ZString Ptr)
  Declare Function iGUIEventAvailable Cdecl Alias "iGUIEventAvailable" () As Integer
  Declare Function iGUIEventID Cdecl Alias "iGUIEventID" () As Integer
  Declare Function iGUIEvent Cdecl Alias "iGUIEvent" () As Integer
  Declare Function iGUIEventData Cdecl Alias "iGUIEventData" () As Integer
  ' GUI  
  Declare Function iCreateWindow Cdecl Alias "iCreateWindow" (ByVal title As ZString Ptr,Byval tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval model As Integer,Byval parent As Integer) As Integer
  Declare Function iStaticText Cdecl Alias "iStaticText" (ByVal text As ZString Ptr,Byval TopX As Integer,Byval TopY As Integer,Byval BotX As Integer,Byval BotY As Integer,Byval border As Integer,Byval wordwrap As Integer,Byval parent As Integer) As Integer
  Declare Function iCreateButton Cdecl Alias "iCreateButton" (ByVal tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval id As Integer,Byval text As ZString Ptr,Byval tip As ZString Ptr,Byval parent As Integer) As Integer
  Declare Function iCreateScrollBar Cdecl Alias "iCreateScrollBar" (ByVal horz As Integer,Byval tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval id As Integer,Byval cur_val As Integer,Byval max_val As Integer,Byval parent As Integer) As Integer
  Declare Function iCreateListBox Cdecl Alias "iCreateListBox" (ByVal tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval id As Integer,Byval background As Integer,Byval parent As Integer) As Integer
  Declare Sub      iAddGadgetItem Cdecl Alias "iAddGadgetItem" (ByVal list_box As Integer,Byval text As ZString Ptr)
  Declare Sub      iInsertGadgetItem Cdecl Alias "iInsertGadgetItem" (ByVal list_box As Integer,Byval text As ZString Ptr,Byval index As Integer)
  Declare Sub      iRemoveGadgetItem Cdecl Alias "iRemoveGadgetItem" (ByVal list_box As Integer,Byval index As Integer)
  Declare Sub      iSelectGadgetItem Cdecl Alias "iSelectGadgetItem" (ByVal list_box As Integer,Byval index As Integer)
  Declare Function iCreateEditBox Cdecl Alias "iCreateEditBox" (ByVal text As ZString Ptr,Byval tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval id As Integer,Byval border As Integer,Byval password As Integer,Byval parent As Integer) As Integer
  Declare Function iStaticImage Cdecl Alias "iStaticImage" (ByVal texture As Integer,Byval x As Integer,Byval y As Integer,Byval usealpha2 As Integer,Byval id As Integer,Byval parent As Integer) As Integer
  Declare Function iCreateCheckBox Cdecl Alias "iCreateCheckBox" (ByVal text As ZString Ptr,Byval tx As Integer,Byval ty As Integer,Byval bx As Integer,Byval by As Integer,Byval id As Integer,Byval checked As Integer,Byval parent As Integer) As Integer
  Declare Sub      iCheckCheckBox Cdecl Alias "iCheckCheckBox" (ByVal checkbox As Integer,Byval checked As Integer)
  Declare Function iAddFileOpen Cdecl Alias "iAddFileOpen" (ByVal text As ZString Ptr,Byval id As Integer,Byval model As Integer,Byval parent As Integer) As Integer
  
  Declare Function iExtrapolatePoint Cdecl Alias "iExtrapolatePoint" (ByVal Time As Single,Byval initpos As Single,Byval vel As Single,Byval accel As Single,Byval maxvel As Single) As Single
  
  
  ' SOUND irrKlang 1.6.0
  Declare Function iKlangInit Cdecl Alias "iKlangInit" () As Integer
  Declare Sub      iKlangUpdate Cdecl Alias "iKlangUpdate" ()
  Declare Sub      iMasterVolume Cdecl Alias "iMasterVolume" (ByVal volume As Single)
  Declare Function iPlaySound Cdecl Alias "iPlaySound" (ByVal file As ZString Ptr,Byval looped As Integer,Byval paused As Integer,Byval track As Integer,Byval mode As Integer,Byval fx As Integer) As Integer
  Declare Function iPlay3DSound Cdecl Alias "iPlay3DSound" (ByVal file As ZString Ptr,Byval x As Single,Byval y As Single,Byval z As Single,Byval looped As Integer,Byval paused As Integer,Byval track As Integer,Byval mode As Integer,Byval fx As Integer) As Integer
  Declare Sub      iPauseAllSounds Cdecl Alias "iPauseAllSounds" (ByVal BOOL As Integer)
  Declare Sub      iStopAllSounds Cdecl Alias "iStopAllSounds" ()
  Declare Sub      iListenerPosition Cdecl Alias "iListenerPosition" (ByVal x As Single,Byval y As Single,Byval z As Single,Byval lookX As Single,Byval lookY As Single,Byval lookZ As Single,Byval velX As Single,Byval velY As Single,Byval velZ As Single,Byval upX As Single,Byval upY As Single,Byval upZ As Single)
  Declare Sub      iFreeSound Cdecl Alias "iFreeSound" (ByVal sound As Integer)
  Declare Sub      iFreeSoundFile Cdecl Alias "iFreeSoundFile" (ByVal file As ZString Ptr)
  Declare Sub      iFreeAllSoundFiles Cdecl Alias "iFreeAllSoundFiles" ()
  Declare Sub      iKlangEnd Cdecl Alias "iKlangEnd" ()
  Declare Function iSoundLength Cdecl Alias "iSoundLength" (ByVal sound As Integer) As Integer
  Declare Function iGetPlayPosition Cdecl Alias "iGetPlayPosition" (ByVal sound As Integer) As Integer
  Declare Function iSoundPlaying Cdecl Alias "iSoundPlaying" (ByVal sound As Integer) As Integer
  Declare Sub      iPauseSound Cdecl Alias "iPauseSound" (ByVal sound As Integer,Byval BOOL As Integer)
  Declare Function iPlaySpeed Cdecl Alias "iPlaySpeed" (ByVal sound As Integer,Byval speed As Single) As Integer
  Declare Function iSetPlayPosition Cdecl Alias "iSetPlayPosition" (ByVal sound As Integer,Byval position As Integer) As Integer
  Declare Sub      iPositionSound Cdecl Alias "iPositionSound" (ByVal sound As Integer,Byval x As Single,Byval y As Single,Byval z As Single)
  Declare Sub      iSoundVolume Cdecl Alias "iSoundVolume" (ByVal sound As Integer,Byval volume As Single)
  Declare Sub      iSoundDistance Cdecl Alias "iSoundDistance" (ByVal sound As Integer,Byval distance As Single)
  Declare Sub      iStopSound Cdecl Alias "iStopSound" (ByVal sound As Integer)
  Declare Sub      iParentNode Cdecl Alias "iParentNode" (ByVal snode As Integer,Byval node As Integer)
  Declare Function iAddSoundNode CDecl Alias "iAddSoundNode" (ByVal file As ZString Ptr,Byval min_dist As Single,Byval loop As Integer,Byval parent As Integer) As Integer



Function iMakeARGB(Byval  alpha2 As Integer,Byval  red As Integer,Byval  green As Integer,ByVal  blue As Integer ) As integer
    Return (alpha2 Shl 24) + (Red Shl 16) + (Green Shl 8) + Blue
End Function