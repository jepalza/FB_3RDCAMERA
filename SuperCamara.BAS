
dim shared as single PI=3.1415926

' teclado y raton
'DIM Shared KeyEventCam as irr_KEY_EVENT PTR
'DIM Shared MouseEventCam as irr_MOUSE_EVENT PTR

Dim shared as single  forwardAngle, WalkSpeed, RunSpeed
Dim shared as integer Forward, Back, Runto, Walk, Idle

dim shared as single  CamUpdateSpeed
dim shared as single  CamZoomOffset
dim shared as integer want_smooth_return ' retorno suave de camara al centro

dim shared as single BR_TURN ' giro usando boton derecho
dim shared as single K_TURN ' giro usando teclas AD
dim shared as single walk_or_run ' andar o correr de uso interno

' variables de matematicas de giro
dim shared as single CamPan
Dim shared as single CamPanCentro ' el centro de CamPan
dim shared as single CamTilt
dim shared as single CamTiltCentro ' el punto mas bajo , mas horizontal
dim shared as single CamZoom
dim shared as single maxZoom, minZoom
dim shared as single camSpeed
Dim shared as single vraton ' velocidad de manejo de raton al mover, mas alto, mas lento
dim shared as irr_Node camTarget ' scenenode
dim shared as irr_vector offset


' para la deteccion de teclas y raton
dim shared as integer Keys_Down(256)
dim shared as integer MWHEEL
dim shared as integer WALKING
dim shared as integer MBRIGHT
dim shared as integer MBLEFT
dim shared as integer MX, MY, OLDMX, OLDMY, OLDMPOSX, OLDMPOSY, MOUSEX, MOUSEY

dim shared as integer Key_For_Walk
dim shared as integer Key_For_Back
dim shared as integer Key_For_Left
dim shared as integer Key_For_Right
dim shared as integer Key_For_Run

Key_For_Walk=KEY_KEY_W
Key_For_Back=KEY_KEY_S
Key_For_Left=KEY_KEY_A
Key_For_Right=KEY_KEY_D
Key_For_Run=KEY_SHIFT ' correr


' velocidades
vraton=10 ' valor mas alto=mas lento al mover con el raton
WalkSpeed=1.3 ' velocidad al andar, mas bajo, mas lento
RunSpeed=5 ' velocidad al correr, mas bajo, mas lento
BR_TURN=5 ' velocidad de giro con boton derecho, mas alto, mas lento
K_TURN= 0.8 ' giro con teclado, mas bajo, mas lento


walk_or_run=walkspeed ' andar o correr
want_smooth_return=0 ' camara retorna a posicion incial

' PITCH = giro principal de izq. a der.
' ROLL = giro de cabeza de hombro a hombro (no lo usamos)
' CROUCH = agachado
' SWIM = nadar

CamPanCentro=170 ' este el valor del centro visto desde la espalda
CamPan=CamPanCentro ' giro principal YAW, giro en el eje del cuerpo en vertical. 100 vemos lado izq., 170, espalda, 230, lado derecho
CamTiltCentro=80 ' el punto mas bajo en horizontal
CamTilt=CamTiltCentro ' cabeceo PITCH (horizontalidad, mas alto, mas plano en el horizonte, mas bajo, mas en planta se ve)

' ajustes del ZOOM
CamZoom=100 ' offset actual zoom
CamZoomOffset = 100	
minZoom=50 
maxZoom=250
CamSpeed = 10 ' pasos de incremento al usar ruleta de raton, mayor valor, mas brusco
CamUpdateSpeed = 0.2 ' velocidad de actualizacion de acercamiento de camara, mayor valor, menos suavidad

' ajustes para la camara que queda tras el jugador
offset.X=0
offset.Y=20 ' separacion de la espalda del jugador
offset.Z=0 ' altura hacia los hombros desde el suelo




' ************************************
' control de eventos de raton y teclado
' ************************************

Sub MyEventReceiver()

   MWHEEL=0

   'While iGUIEventAvailable
      'KeyEventCam = iGUIEventAvailable 'irrReadKeyEvent ' capturamos teclas
      'Print iGUIEventAvailable
      'if iGetKey() = KEY_ESCAPE then end   ' EXIT
'Print iGetKey();
      if iGetKey() Then
      			dim n as integer
      			for n=1 to 255
      				if (iGetKey()=n) then Keys_Down(n)=1
      			Next
      			'iFlushKeys()
      else
      			dim n as integer
      			for n=1 to 255
      				'if (iGetKey()=n) then 
      					Keys_Down(n)=0
      				'EndIf
      			Next
      			'iFlushKeys()
      end if   
   'Wend
   'iReadGUIEvent()
   'iDrawGUI()
   'Cls:Locate 5,5:Print iGUIEventAvailable(),iGUIEvent(),iGUIEventID(),iGUIEventData()
   'while iGUIEventAvailable
      'MouseEventCam = iGUIEventAvailable 'irrReadMouseEvent
   		If iMouseDown(IRR_RMOUSE_BUTTON) Then
   			OLDMPOSX=MOUSEX
   			OLDMPOSY=MOUSEY
   			MBRIGHT=1
   		ElseIf iMouseDown(IRR_RMOUSE_BUTTON)=0 Then
   			MBRIGHT=0
   		end if
   		
   		if iMouseDown(IRR_LMOUSE_BUTTON) then
   			OLDMPOSX=MOUSEX
   			OLDMPOSY=MOUSEY
   			MBLEFT=1
   		ElseIf iMouseDown(IRR_LMOUSE_BUTTON)=0 Then
   			MBLEFT=0
   		end if
   		
   		'if iMouseWheel() Then
   		   MWHEEL=iMouseWheel()*2
   		'End If
   		
   		'If iMouseDown(IRR_LMOUSE_BUTTON)=0 Then
   			MOUSEX=iMouseX()
   			MOUSEY=iMouseY()
   		'End if
   'wend

end sub

' *******************************************
' animaciones
' *******************************************
sub ResetAnimFlag()
		Forward= 0
		Back= 0
		RunTo= 0
		Walk= 0
		Idle= 0
end sub

' correr
Sub RunForwardMode()
		if (RunTo and Forward) then exit sub
		ResetAnimFlag()
		RunTo=1
		Forward=1
		'irrsetNodeAnimationRange(JugadorWOW,RunToFrames(0),RunToFrames(1))
		'irrsetNodeAnimationSpeed(JugadorWOW,RunToFrameSpeed)
End sub

' andar
Sub WalkForwardMode()	
		if (Walk and Forward) then exit sub
		ResetAnimFlag()
		Walk=1
		Forward=1
		'node, mode, speed=24? ,first_frame, last_frame ,transition
		iAnimateNode(JugadorWOW,0, 24 ,161,183, 1)
End sub

' retroceder
Sub WalkBackMode()
		if Back then exit sub
		ResetAnimFlag()
		Back=1
		'irrsetNodeAnimationRange(JugadorWOW,WALKBACKFrames(0),WALKBACKFrames(1))
		'irrsetNodeAnimationSpeed(JugadorWOW,WalkBackFrameSpeed)
End sub

' parado
Sub IdleMode()
	if Idle then exit Sub
	ResetAnimFlag()
	Idle=1
	' node, mode, speed=24? , first_frame, last_frame, transition
	iAnimateNode(JugadorWOW,0, 24 ,0,150, 1)
End Sub


' **************************************
' control de acciones
' **************************************

sub Turn (tdegrees as single)
	dim as irr_vector r1
   ' cogemos la actual rotacion de la camara en grados
   r1.x=iNodeRoll(JugadorWOW,0)
   r1.y=iNodeYaw(JugadorWOW,0)
   r1.z=iNodePitch(JugadorWOW,0)
	r1.y+=tdegrees 
	iRotateNode(JugadorWOW,r1.x,r1.y,r1.z)
end sub


Sub stepMotion (milliseconds as integer)
		dim as single sTime=milliseconds
		Dim as irr_vector position	
		dim as irr_vector tmpv
		Dim as irr_vector rotation
		
		' get node "jugador" position
		position.x=iNodeX(JugadorWOW,0)
		position.y=iNodeY(JugadorWOW,0)
		position.z=iNodeZ(JugadorWOW,0)
		
   	' cogemos la actual rotacion de la camara en grados
   	rotation.x=iNodeRoll(JugadorWOW,0)
   	rotation.y=iNodeYaw(JugadorWOW,0)
   	rotation.z=iNodePitch(JugadorWOW,0)
		
		forwardAngle=rotation.Y
		
		If (Walk and Forward) Then		
   		tmpv.X=+(cos(forwardAngle*PI/180)*walk_or_run)
   		tmpv.Z=-(sin(forwardAngle*PI/180)*walk_or_run)
			iPositionNode (JugadorWOW,position.X+tmpv.X*sTime,position.Y,position.Z+tmpv.Z*sTime)			
		End if

		if (Runto=0 and Back) Then
   		tmpv.X=-(cos(forwardAngle*PI/180)*walk_or_run)
   		tmpv.Z=+(sin(forwardAngle*PI/180)*walk_or_run)	
			iPositionNode (JugadorWOW,position.X+tmpv.X*sTime,position.Y,position.Z+tmpv.Z*sTime)			
		End if
			
		if (Runto and Forward) Then		
			tmpv.X=+(cos(forwardAngle*PI/180)*RunSpeed)
			tmpv.Z=-(sin(forwardAngle*PI/180)*RunSpeed)
			position.X=position.X+tmpv.X*sTime
			position.Z=position.Z+tmpv.Z*sTime			
			iPositionNode (JugadorWOW,position.X,position.Y,position.Z)			
		End if
		
End Sub


' ****************************************
' matematica de giros
' ****************************************
Sub newcameraposition()

	dim as irr_Vector CPosVector
	dim as irr_Vector NewCamLocation
	dim as irr_Vector Target1
	
	dim as irr_Vector RotCam

	CPosVector.X=cos(CamPan *PI/180)*sin(CamTilt*PI/180)
	CPosVector.Y=cos(CamTilt*PI/180)
	CPosVector.Z=sin(CamPan *PI/180)*sin(CamTilt*PI/180)

   ' cogemos la actual rotacion de la camara en grados
   'Print "giro jugador:";iNodeRoll(JugadorWOW,0),iNodeYaw(JugadorWOW,0),iNodePitch(JugadorWOW,0)
   RotCam.x=iNodeRoll(JugadorWOW,0)
   RotCam.y=iNodeYaw(JugadorWOW,0)
   RotCam.z=iNodePitch(JugadorWOW,0)

	
	   ' ----------  convierte un vector 3D en radianes y lo mete en una matriz --------
	   dim M(8) as single ' matriz de 0 a 8 , 9 elementos
      
      ' pasamos a radianes
      RotCam.X= RotCam.X * PI /180 
      RotCam.Y= RotCam.Y * PI /180 
      RotCam.Z= RotCam.Z * PI /180 
      
      ' guardamos los grados en una matriz 3x3
		Dim as Single sinr = sin( RotCam.X ) ' roll
		Dim as Single cosr = cos( RotCam.X )
		Dim as Single sinp = sin( RotCam.Y ) ' pitch
		Dim as Single cosp = cos( RotCam.Y )
		Dim as Single siny = sin( RotCam.Z ) ' yaw
		Dim as Single cosy = cos( RotCam.Z )
		
		Dim as Single cosr_sinp = cosr*sinp
		Dim as Single sinr_sinp = sinr*sinp

		M(0) = ( cosp*cosy )
		M(1) = ( cosp*siny )
		M(2) = ( -sinp )

		M(3) = ( sinr_sinp*cosy-cosr*siny )
		M(4) = ( sinr_sinp*siny+cosr*cosy )
		M(5) = ( sinr*cosp )

		M(6) = ( cosr_sinp*cosy+sinr*siny )
		M(7) = ( cosr_sinp*siny-sinr*cosy )
		M(8) = ( cosr*cosp )

		'------- multiplica el nuevo vector deseado por la matriz anterior ---------

		Dim as irr_vector vector
		vector.X = CPosVector.X*M(0) + CPosVector.Y*M(3) + CPosVector.Z*M(6)
		vector.Y = CPosVector.X*M(1) + CPosVector.Y*M(4) + CPosVector.Z*M(7)
		vector.Z = CPosVector.X*M(2) + CPosVector.Y*M(5) + CPosVector.Z*M(8)

      ' recogemos el nuevo vector ( y pasamos a grados otra vez --> noooo por ahora)
		CPosVector.X = vector.X '* 180 / PI
		CPosVector.Y = vector.Y '* 180 / PI
		CPosVector.Z = vector.Z '* 180 / PI
		
		'----------------------------------------------------------------------------
		
	' get node "jugador" position
	Target1.X=iNodeX(JugadorWOW,0)
	Target1.Y=iNodeY(JugadorWOW,0)
	Target1.Z=iNodeZ(JugadorWOW,0)

	NewCamLocation.X=(Target1.X+offset.X)+CPosVector.X*camZoom
	NewCamLocation.Y=(Target1.Y+offset.Y)+CPosVector.Y*camZoom
	NewCamLocation.Z=(Target1.Z+offset.Z)+CPosVector.Z*camZoom

	iPositionNode (CamaraWOW,NewCamLocation.X,NewCamLocation.Y,NewCamLocation.Z)
	iCameraTarget (CamaraWOW,Target1.X,Target1.Y,Target1.Z)


end sub



' ***********************************
' movemos el personaje
' ***********************************
sub newplayerposition(msecs as integer)
		
		if (MBRIGHT or MBLEFT) Then
		   iHideMouse
		end if
		
		if (MBRIGHT=0 and MBLEFT=0) Then
			iShowMouse
		end If

		' parado
		if ( (iKeyDown(Key_For_Walk)=0) _
		     and (iKeyDown(Key_For_Back)=0) _
		     and (iKeyDown(Key_For_Left)=0) _
		     and (iKeyDown(Key_For_Right)=0) _
		     and (MBRIGHT=0 or MBLEFT=0)) Then
   				IdleMode()
		end if
		
		' andar
		if ( (iKeyDown(Key_For_Walk) _
               or (MBRIGHT and MBLEFT)) _ ' los dos botones del raton apretados, el monigot va hacia adelante
               and (iKeyDown(Key_For_Back)=0) _
               and (iKeyDown(Key_For_Left)=0) _
               and (iKeyDown(Key_For_Right)=0) ) Then          

   				if iKeyDown(Key_For_Run) Then
   					RunForwardMode()
   					walk_or_run=runspeed
   				else
   				   WalkForwardMode()
   				   walk_or_run=walkspeed
   				end if

		End If
		
		' retroceder
		if (iKeyDown(Key_For_Back) _
             and ((MBLEFT and MBRIGHT)=0) _
             and (iKeyDown(Key_For_Walk)=0) _
             and (iKeyDown(Key_For_Left)=0) _
             and (iKeyDown(Key_For_Right)=0) ) Then             
				WalkBackMode()
		end if
				
	 ''''''''''''''''''''''''''''''''''''''''''''''''''''
		
		if (MBRIGHT or MBLEFT and (MOUSEY <> OLDMPOSY)) Then
			SetMouse(OLDMPOSX,OLDMPOSY)
		end if
				
		if (MBRIGHT and (MOUSEX <> OLDMPOSX)) Then
			Turn(((MOUSEX-OLDMPOSX)/BR_TURN)) ' velocidad de giro con el boton derecho
			SetMouse(OLDMPOSX,OLDMPOSY)
		end if
			
		if (MBLEFT=1 and MBRIGHT=0 and (MOUSEX <> OLDMPOSX)) Then
			SetMouse(OLDMPOSX,OLDMPOSY)
		End If
		
		if (iKeyDown(Key_For_Left) and MBRIGHT=0) Then
			turn(-K_TURN) ' velocidad de giro tecla izq.
		End If

		if (iKeyDown(Key_For_Right) and MBRIGHT=0) Then
			turn(K_TURN) ' velocidad de giro tecla der.
		End If

	stepMotion(msecs)

end Sub


sub MovePlayer(ElapsedTime as single)
   
      ' camtilt = cabeceo arriba-abajo
		if (MBLEFT And (MOUSEY<>OLDMPOSY)) then
			CamTilt=CamTilt-((MOUSEY-OLDMPOSY)/vraton) ' dividir por un mayor valor, mas lento el movimiento de raton
			If(CamTilt< 10) then CamTilt= 10 ' altura maxima , casi visto en planta
			If(CamTilt> 90) then CamTilt= 90 ' altura mas baja (horizontal casi) de giro de barbilla hacia arriba
			' horizontales, mitad (espalda) en 170
			CamPan=CamPan-((MOUSEX-OLDMPOSX)/vraton) ' dividir por un mayor valor, mas lento el movimiento de raton
			if( CamPan > 330) then CamPan = 330 ' horizontal, lado derecho
			if( CamPan <  20) then CamPan = 20 ' horizontal, lado izquiero
			'
			SetMouse(OLDMPOSX,OLDMPOSY)
		end if

		'if (MBRIGHT and (MOUSEX<>OLDMPOSX)) then
			'SetMouse(OLDMPOSX,OLDMPOSY)
		'end if

		
		' acercamiento suavizado
		if (MWHEEL<>0) Then
		   CamZoomOffset -= CamSpeed * MWHEEL * ElapsedTime			  
		   if (CamZoomOffset < minZoom ) then CamZoomOffset = minZoom 
		   if (CamZoomOffset > maxZoom ) then CamZoomOffset = maxZoom
		   MWHEEL = 0
		end if

		CamZoom += ( CamZoomOffset - CamZoom ) * CamUpdateSpeed * ElapsedTime
		
		' retorna la camara al centro al soltar el raton izq.
		If want_smooth_return then
   		if ( MBLEFT=0 ) then 
   		  'CamPan += ( -CamPan ) * 0.005f * ElapsedTime
   		  If Int(CamPan)>CamPanCentro Then CamPan += ( -CamPan ) * 0.005f * ElapsedTime
   		  If Int(CamPan)<CamPanCentro Then CamPan -= ( -CamPan ) * 0.01f * ElapsedTime
   		end if
		End if

   ' estudia pulsaciones de raton y teclado para ver como queremos mover
	newplayerposition(ElapsedTime)
	
	' actualiza posicion camaras
	newcameraposition()
	
	'Locate 1,1
	'Print "CAMPAM:";CamPan;"      "
	'Print "CAMTIL:";CamTilt;"      "

end sub
