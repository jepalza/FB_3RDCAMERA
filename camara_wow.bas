' Jepalza, 2014-2023: camara con moviemientos estilo WOW (world of warcraft)
' basado en el ejemplo del motor grafico Irrlicht "3rdpersoncam.cpp" example (IRR1.3.1)

#Define irr_node Integer' Ptr
#Define irr_mesh Integer' Ptr 
#Define irr_Texture Integer' Ptr 
#Define irr_Camera Integer' Ptr 
#Define irr_Selector Integer' ptr


' a vector consisting of 3 float values
TYPE IRR_VECTOR
    x as single
    y as single
    z as single
END Type

' Irrlicht Keyboard and Mouse Event Structures
TYPE IRR_MOUSE_EVENT
    action as uinteger
    delta as single
    x as integer
    y as integer
END TYPE

TYPE IRR_KEY_EVENT
    key as uinteger
    direction as uinteger
    flags as uinteger
END Type


#Inclib "bIrrlicht"
#Include "fb_Irrlicht.bi"

' ----------
   ' variables COMUNES al modulo principal y supercamara. Es obligatorio hacerlo aqui
   DIM shared CamaraWOW  As irr_node ' esta DEBE ser global
   DIM shared JugadorWOW as irr_node ' esta DEBE ser global
   
   ' incluimos el modulo de camara
   #include "SuperCamara.bas"
' -----------


' variables para el mapa
DIM MapCollision as irr_Selector
dim BSPMesh as irr_mesh
Dim BSPNode as irr_node

' variables para el jugador
DIM MD2Mesh as irr_mesh
DIM MeshTexture as irr_Texture

' variables para la camara principal
DIM Camera as irr_Camera

' windowID en caso de emplear ventanas windows8 (createwindowexa)
' 	WindowID,drivertype,Width,Height,bits,fullscreen
' 				shadows,dontignoreinput,vsyncenabled,devicetype,doublebufferenabled,antialiasenabled,highprecisionfpu  
iIrr3DAdvanced(0, irr_EDT_OPENGL, 800, 600, 32, FALSE,  _
						   FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE )
'iIrr3D( 640, 480, 32, FALSE  )

iAppTitle( "Camara WOW" )

iAddZipFile( "BSPmaps/ctfcomp02_hazard.pk3",TRUE,TRUE,"") ' ultimo param. = password
BSPMesh = iLoadMesh( "ctfcomp02_hazard.bsp" )
BSPNode = iAddOctreeMeshNode( BSPMesh )

' creamos una camara basica, sin valores  
Camera=iCreateCamera(BSPNode)
Print
Print "Camera Positon :";iNodeX(Camera,0),iNodeY(Camera,0),iNodeZ(Camera,0)
Print "Camera vector  :";iCameraRightX(Camera),iCameraRightY(Camera),iCameraRightZ(Camera)
Print "Camera Looks At:";iCameraTargetX(Camera),iCameraTargetY(Camera),iCameraTargetZ(Camera)
Print
dim as integer iniXpos,iniYpos,iniZpos
iniXpos=386  
iniYpos=366  
iniZpos=2726 

' posicionamos la camara
CamaraWOW = Camera
iCameraTarget( CamaraWOW, iniXpos, iniYpos, iniZpos ) ' la camara apunta al jugador
iPositionNode( CamaraWOW, iniXpos+offset.X, iniYpos+offset.Y, iniZpos+offset.Z ) ' y se situa tras el 
iCameraRange ( CamaraWOW, 6000, 1 ) ' far, near
Print "Camera Positon :";iNodeX(CamaraWOW,0),iNodeY(CamaraWOW,0),iNodeZ(CamaraWOW,0)
Print "Camera vector  :";iCameraRightX(CamaraWOW),iCameraRightY(CamaraWOW),iCameraRightZ(CamaraWOW)
Print "Camera Looks At:";iCameraTargetX(CamaraWOW),iCameraTargetY(CamaraWOW),iCameraTargetZ(CamaraWOW)
print
' mapa de colisiones
MapCollision = iGetCollisionGroupFromComplexMesh( BSPMesh, BSPNode , 0) ' ultimo param=frame


'''''''''' incluye jugador  '''''''''''''
   MD2Mesh = iLoadMesh( "Models/Blade.md2" )
   
   MeshTexture = iLoadTexture( "Models/Blade.jpg" )
   
   JugadorWOW = iAddMeshToScene( MD2Mesh )
   
   iPositionNode( JugadorWOW,  iniXpos, iniYpos, iniZpos )
   iScaleNode   ( JugadorWOW, 1.7, 1.7, 1.7 )
   iRotateNode  ( JugadorWOW, 0, -90, 0 )
   
   iNodeTexture ( JugadorWOW, MeshTexture, 0 )
   
   'irrSetNodeMaterialFlag( JugadorWOW, wMF_LIGHTING, wON )
   
   iAmbientLight( 1,1,1 ) ' sin este, el jugador sale oscuro
'''''''''' fin inclusion jugador ''''''''''''''''

' creamos colisiones en el jugador (player collision)
iCollisionAnimator(_
                    MapCollision,_
                    JugadorWOW,_
                    30.0,30.0,30.0,_
                    0.0,-9.8,0.0,_ ' -9.8 la gravedad que empuja hacia abajo, en el eje Y
                    0.0,11,0.0 ) ' 11 es la esfera que rodea al jugador, hasta la suela de la bota



' -----------------------------------------------------------------------------
dim as single oldtime, newtime, etime
'oldtime=timer
'newtime=oldtime
While iRun() And (Not iKeyHit( KEY_ESCAPE ))
    iBeginScene()
 
    MyEventReceiver() ' lecturas teclado/raton
    newtime=timer
    'etime=newtime-oldtime
    moveplayer(1)'etime) ' velocidad de refresco, depende del PC, mayor, mas rapido
    'If etime>4 then oldtime=newtime
 	  
    ' draw the scene
    iDrawScene()

    ' end drawing the scene and render it
    iEndScene()

	 Sleep 1
    'irrSetFPS ' si no ponemos este, va a TODA OSTIA!!!, a lo que da la CPU
Wend

iEndIrr3D()