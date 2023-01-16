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


' Enumerated Type Definitions
' Rendering Device Types
'ENUM IRR_DEVICE_TYPES
Const IRR_EDT_NULL = 0       	      ' a NULL device with no display
Const IRR_EDT_SOFTWARE = 1            ' Irrlichts default software renderer
Const IRR_EDT_SOFTWARE2 = 2           ' An improved quality software renderer
Const IRR_EDT_OPENGL = 3              ' hardware accelerated OpenGL renderer
Const IRR_EDT_DIRECT3D8 = 5           ' hardware accelerated DirectX 8 renderer * NOT AVAILABLE
Const IRR_EDT_DIRECT3D9 = 5           ' hardware accelerated DirectX 9 renderer

' Device Type Engine
' for advanced Engine init using "iIrr3DAdvanced"
Const EIDT_BEST = 0
Const EIDT_WIN32 = 1
Const EIDT_WINCE = 2
Const EIDT_X11 = 3
Const EIDT_OSX = 4
Const EIDT_SDL = 5
Const EIDT_FRAMEBUFFER = 6
Const EIDT_CONSOLE = 7

' Material Flags
'ENUM IRR_MATERIAL_FLAGS
Const IRR_EMF_WIREFRAME = 0     	   ' Render as wireframe outline.
Const IRR_EMF_POINTCLOUD = 1           ' Draw a point cloud instead of polygons.
Const IRR_EMF_GOURAUD_SHADING = 2      ' Render smoothly across polygons.
Const IRR_EMF_LIGHTING = 3             ' Material is effected by lighting.
Const IRR_EMF_ZBUFFER = 4              ' Enable z-buffer.
Const IRR_EMF_ZWRITE_ENABLE = 5        ' Can write as well as read z-buffer.
Const IRR_EMF_BACK_FACE_CULLING = 6    ' Cull polygons facing away.
Const IRR_EMF_FRONT_FACE_CULLING = 7   ' Cull polygons facing front.
Const IRR_EMF_BILINEAR_FILTER = 8      ' Enable bilinear filtering.
Const IRR_EMF_TRILINEAR_FILTER = 9     ' Enable trilinear filtering.
Const IRR_EMF_ANISOTROPIC_FILTER = 10  ' Reduce blur in distant textures.
Const IRR_EMF_FOG_ENABLE = 11          ' Enable fogging in the distance.
Const IRR_EMF_NORMALIZE_NORMALS = 12   ' Use when scaling dynamically lighted models.
Const IRR_EMF_TEXTURE_WRAP = 13        ' Gives access to all layers texture wrap settings. Overwrites separate layer settings. 
Const IRR_EMF_ANTI_ALIASING = 14       ' Anti-aliasing mode. 
Const IRR_EMF_COLOR_MASK = 15          ' ColorMask bits, for enabling the color planes. 
Const IRR_EMF_COLOR_MATERIAL = 16      ' ColorMaterial enum for vertex color interpretation. 
Const IRR_EMF_USE_MIP_MAPS = 17		   ' For enabling/disabling mipmap usage
Const IRR_EMF_BLEND_OPERATION = 18	   ' For blend operation
Const IRR_EMF_POLYGON_OFFSET = 19	   ' For polygon offset

' Material Types
'ENUM IRR_MATERIAL_TYPES
Const IRR_EMT_SOLID = 0           	  ' Standard solid rendering uses one texture
Const IRR_EMT_SOLID_2_LAYER = 1       ' 2 blended textures using vertex alpha2 value
Const IRR_EMT_LIGHTMAP = 2            ' 2 textures: 0=color 1=lighting level and ignores vertex lighting
Const IRR_EMT_LIGHTMAP_ADD = 3        ' ... as above but adds levels instead of modulating between them
Const IRR_EMT_LIGHTMAP_M2 = 4         ' ... as above but color levels are multiplied by 2 for brightening
Const IRR_EMT_LIGHTMAP_M4 = 5         ' ... as above but color leels are multiplied by 4 for brightening
Const IRR_EMT_LIGHTMAP_LIGHTING = 6   ' 2 textures: 0=color 1=lighting level but supports dynamic lighting
Const IRR_EMT_LIGHTMAP_LIGHTING_M2 = 7    ' ... as above but color levels are multiplied by 2 for brightening
Const IRR_EMT_LIGHTMAP_LIGHTING_M4 = 8    ' ... as above but color leels are multiplied by 4 for brightening
Const IRR_EMT_DETAIL_MAP = 9          ' 2 blended textures: the first is a color map the second at a different scale adds and subtracts from the color to add detail
Const IRR_EMT_SPHERE_MAP = 10          ' makes the material appear reflective
Const IRR_EMT_REFLECTION_2_LAYER = 11  ' a reflective material blended with a color texture
Const IRR_EMT_TRANSPARENT_ADD_COLOR = 12   ' a transparency effect that simply adds a color texture to the background. the darker the color the more transparent it is.
Const IRR_EMT_TRANSPARENT_ALPHA_CHANNEL = 13   ' a transparency effect that uses the color textures alpha2 as a transparency level
Const IRR_EMT_TRANSPARENT_ALPHA_CHANNEL_REF = 14   ' a transparency effect that uses the color textures alpha, the pixel is only drawn if the alpha2 is > 127. this is a fast effect that does not blur edges and is ideal for leaves & grass etc.
Const IRR_EMT_TRANSPARENT_VERTEX_alpha2 = 15    ' a transparency effect that uses the vertex alpha2 value
Const IRR_EMT_TRANSPARENT_REFLECTION_2_LAYER = 16  ' a transparent & reflecting effect. the first texture is a reflection map, the second a color map. transparency is from vertex alpha
Const IRR_EMT_NORMAL_MAP_SOLID = 17    ' A solid normal map renderer. First texture is color, second is normal map. Only use nodes added with IrrAddStaticMeshForNormalMappingToScene. Only supports nearest two lights. Requires vertex and pixel shaders 1.1
Const IRR_EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR = 18    ' ... as above only with a transparency effect that simply adds the color to the background. the darker the color the more transparent it is.
Const IRR_EMT_NORMAL_MAP_TRANSPARENT_VERTEX_alpha2 = 19 ' ... as above only with a transparency effect that uses the vertex alpha2 value
Const IRR_EMT_PARALLAX_MAP_SOLID = 20  ' similar to the solid normal map but more realistic providing virtual displacement of the surface. Uses the alpha2 channel of the normal map for height field displacement. Requires vertex shader 1.1 and pixel shader 1.4.
Const IRR_EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR = 21  ' ... as above only with a transparency effect that simply adds the color to the background. the darker the color the more transparent it is.
Const IRR_EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_alpha2 = 22   ' ... as above only wiht a transparency effect that uses the vertex alpha2 value
Const IRR_EMT_ONE_TEXTURE_BLEND = 23	'BlendFunc = source * sourceFactor + dest * destFactor ( E_BLEND_FUNC ) Using only First texture. Generic blending method.
Const IRR_EMT_FORCE_32BIT = &h7fffffff

' blend factors for the ONE_TEXTURE_BLEND material
'ENUM IRR_BLEND_FACTOR
Const EBF_ZERO = 0
Const EBF_ONE = 1
Const EBF_DST_COLOR = 2
Const EBF_ONE_MINUS_DST_COLOR = 3
Const EBF_SRC_COLOR = 4
Const EBF_ONE_MINUS_SRC_COLOR = 5
Const EBF_SRC_alpha2 = 6
Const EBF_ONE_MINUS_SRC_alpha2 = 7
Const EBF_DST_alpha2 = 8
Const EBF_ONE_MINUS_DST_alpha2 = 9
Const EBF_SRC_ALPHA_SATURATE = 10          

' Mouse events
'ENUM IRR_MOUSE_EVENTS
Const IRR_EMIE_LMOUSE_PRESSED_DOWN = 0
Const IRR_EMIE_RMOUSE_PRESSED_DOWN = 1
Const IRR_EMIE_MMOUSE_PRESSED_DOWN = 2
Const IRR_EMIE_LMOUSE_LEFT_UP = 3
Const IRR_EMIE_RMOUSE_LEFT_UP = 4
Const IRR_EMIE_MMOUSE_LEFT_UP = 5
Const IRR_EMIE_MOUSE_MOVED = 6
Const IRR_EMIE_MOUSE_WHEEL = 7
Const IRR_LMOUSE_BUTTON = 1
Const IRR_RMOUSE_BUTTON = 2
Const IRR_MMOUSE_BUTTON = 3

' Event types
'enum IRR_EEVENT_TYPE
Const IRR_EET_GUI_EVENT            = 0
Const IRR_EET_MOUSE_INPUT_EVENT    = 1
Const IRR_EET_KEY_INPUT_EVENT      = 2
Const IRR_EET_JOYSTICK_INPUT_EVENT = 3
Const IRR_EET_LOG_TEXT_EVENT       = 4
Const IRR_EET_USER_EVENT           = 5

' MD2 Animation sequences
'ENUM IRR_MD2_ANIM_SEQUENCES
Const IRR_EMAT_STAND = 0
Const IRR_EMAT_RUN = 1
Const IRR_EMAT_ATTACK = 2
Const IRR_EMAT_PAIN_A = 3
Const IRR_EMAT_PAIN_B = 4
Const IRR_EMAT_PAIN_C = 5
Const IRR_EMAT_JUMP = 6
Const IRR_EMAT_FLIP = 7
Const IRR_EMAT_SALUTE = 8
Const IRR_EMAT_FALLBACK = 9
Const IRR_EMAT_WAVE = 10
Const IRR_EMAT_POINT = 11
Const IRR_EMAT_CROUCH_STAND = 12
Const IRR_EMAT_CROUCH_WALK = 13
Const IRR_EMAT_CROUCH_ATTACK = 14
Const IRR_EMAT_CROUCH_PAIN = 15
Const IRR_EMAT_CROUCH_DEATH = 16
Const IRR_EMAT_DEATH_FALLBACK = 17
Const IRR_EMAT_DEATH_FALLFORWARD = 18
Const IRR_EMAT_DEATH_FALLBACKSLOW = 19
Const IRR_EMAT_BOOM = 20

' MD3 Animation Sequences
'ENUM IRR_EMD3_ANIMATION_TYPE
Const IRR_EMD3_BOTH_DEATH_1 = 0
Const IRR_EMD3_BOTH_DEAD_1 = 1
Const IRR_EMD3_BOTH_DEATH_2 = 2
Const IRR_EMD3_BOTH_DEAD_2 = 3
Const IRR_EMD3_BOTH_DEATH_3 = 4
Const IRR_EMD3_BOTH_DEAD_3 = 5
Const IRR_EMD3_TORSO_GESTURE = 6	
Const IRR_EMD3_TORSO_ATTACK_1 = 7
Const IRR_EMD3_TORSO_ATTACK_2 = 8
Const IRR_EMD3_TORSO_DROP = 9
Const IRR_EMD3_TORSO_RAISE = 10
Const IRR_EMD3_TORSO_STAND_1 = 11
Const IRR_EMD3_TORSO_STAND_2 = 12
Const IRR_EMD3_LEGS_WALK_CROUCH = 13	
Const IRR_EMD3_LEGS_WALK = 14
Const IRR_EMD3_LEGS_RUN = 15
Const IRR_EMD3_LEGS_BACK = 16
Const IRR_EMD3_LEGS_SWIM = 17
Const IRR_EMD3_LEGS_JUMP_1 = 18
Const IRR_EMD3_LEGS_LAND_1 = 19
Const IRR_EMD3_LEGS_JUMP_2 = 20
Const IRR_EMD3_LEGS_LAND_2 = 21
Const IRR_EMD3_LEGS_IDLE = 22
Const IRR_EMD3_LEGS_IDLE_CROUCH = 23 	
Const IRR_EMD3_LEGS_TURN = 24
'Const IRR_EMD3_ANIMATION_COUNT = 25

'ENUM IRR_EMD3Models
Const IRR_EEMD3_HEAD = 0
Const IRR_EEMD3_UPPER = 1
Const IRR_EEMD3_LOWER = 2
Const IRR_EEMD3_WEAPON = 3
Const IRR_EEMD3_NUMMODELS = 4

' For the FPS camera
'Enum EKEY_ACTION
Const EKA_MOVE_FORWARD = 0
Const EKA_MOVE_BACKWARD = 1
Const EKA_STRAFE_LEFT = 2
Const EKA_STRAFE_RIGHT = 3
Const EKA_JUMP_UP = 4
Const EKA_COUNT = 5
Const EKA_FORCE_32BIT = &h7fffffff

' Light types
'Enum E_LIGHT_TYPE
Const ELT_POINT = 0
Const ELT_SPOT = 1
Const ELT_DIRECTIONAL = 2

' Joint animation modes
'Enum IRR_JOINT_MODE
Const IRR_JOINT_MODE_NONE = 0
Const IRR_JOINT_MODE_READ = 1
Const IRR_JOINT_MODE_CONTROL = 2

' shadow modes for lighting
'Enum E_SHADOW_MODE
Const ESM_RECEIVE = 0
Const ESM_CAST = 1
Const ESM_BOTH = 2
Const ESM_EXCLUDE = 3
Const ESM_COUNT = 4

' filter types, up to 16 samples PCF.
'Enum E_FILTER_TYPE
Const EFT_NONE = 0
Const EFT_4PCF = 1
Const EFT_8PCF = 2
Const EFT_12PCF = 3
Const EFT_16PCF = 4
Const EFT_COUNT = 5

' Pre-programmed shader constants
'Enum IRR_SHADER_CONSTANTS
Const IRR_NO_PRESET = 0
Const IRR_INVERSE_WORLD = 1
Const IRR_WORLD_VIEW_PROJECTION = 2
Const IRR_CAMERA_POSITION = 3
Const IRR_TRANSPOSED_WORLD = 4

' Vertex shader program versions
'Enum IRR_VERTEX_SHADER_VERSION
Const EVST_VS_1_1 = 0
Const EVST_VS_2_0 = 1
Const EVST_VS_2_a = 2
Const EVST_VS_3_0 = 3

' Pixel shader program versions
'Enum IRR_PIXEL_SHADER_VERSION
Const EPST_PS_1_1 = 0
Const EPST_PS_1_2 = 1
Const EPST_PS_1_3 = 2
Const EPST_PS_1_4 = 3
Const EPST_PS_2_0 = 4
Const EPST_PS_2_a = 5
Const EPST_PS_2_b = 6
Const EPST_PS_3_0 = 7

' enumeration for querying features of the video driver. 
'Enum IRR_VIDEO_FEATURE_QUERY
Const EVDF_RENDER_TO_TARGET = 0	    ' Is driver able to render to a surface?
Const EVDF_HARDWARE_TL = 1    ' Is hardeware transform and lighting supported?
Const EVDF_MULTITEXTURE = 2    ' Are multiple textures per material possible?
Const EVDF_BILINEAR_FILTER = 3    ' Is driver able to render with a bilinear filter applied?
Const EVDF_MIP_MAP = 4    ' Can the driver handle mip maps?
Const EVDF_MIP_MAP_AUTO_UPDATE = 5    ' Can the driver update mip maps automatically?
Const EVDF_STENCIL_BUFFER = 6    ' Are stencilbuffers switched on and does the device support stencil buffers?
Const EVDF_VERTEX_SHADER_1_1 = 7    ' Is Vertex Shader 1.1 supported?
Const EVDF_VERTEX_SHADER_2_0 = 8    ' Is Vertex Shader 2.0 supported?
Const EVDF_VERTEX_SHADER_3_0 = 9    ' Is Vertex Shader 3.0 supported?
Const EVDF_PIXEL_SHADER_1_1 = 10    ' Is Pixel Shader 1.1 supported?
Const EVDF_PIXEL_SHADER_1_2 = 11    ' Is Pixel Shader 1.2 supported?
Const EVDF_PIXEL_SHADER_1_3 = 12    ' Is Pixel Shader 1.3 supported?
Const EVDF_PIXEL_SHADER_1_4 = 13    ' Is Pixel Shader 1.4 supported?
Const EVDF_PIXEL_SHADER_2_0 = 14    ' Is Pixel Shader 2.0 supported?
Const EVDF_PIXEL_SHADER_3_0 = 15    ' Is Pixel Shader 3.0 supported?
Const EVDF_ARB_VERTEX_PROGRAM_1 = 16    ' Are ARB vertex programs v1.0 supported?
Const EVDF_ARB_FRAGMENT_PROGRAM_1 = 17    ' Are ARB fragment programs v1.0 supported?
Const EVDF_ARB_GLSL = 18    ' Is GLSL supported?
Const EVDF_HLSL = 19    ' Is HLSL supported?
Const EVDF_TEXTURE_NSQUARE = 20    ' Are non-square textures supported?
Const EVDF_TEXTURE_NPOT = 21    ' Are non-power-of-two textures supported?
Const EVDF_FRAMEBUFFER_OBJECT = 22    ' Are framebuffer objects supported?
Const EVDF_VERTEX_BUFFER_OBJECT = 23    ' Are vertex buffer objects supported?
Const EVDF_ALPHA_TO_COVERAGE = 24    ' Supports alpha2 To Coverage
Const EVDF_COLOR_MASK = 25    ' Supports Color masks (disabling color planes in output)
Const EVDF_MULTIPLE_RENDER_TARGETS = 26    ' Supports multiple render targets at once
Const EVDF_MRT_BLEND = 27    ' Supports separate blend settings for multiple render targets
Const EVDF_MRT_COLOR_MASK = 28    ' Supports separate color masks for multiple render targets
Const EVDF_MRT_BLEND_FUNC = 29    ' Supports separate blend functions for multiple render targets
Const EVDF_GEOMETRY_SHADER = 30    ' Supports geometry shaders

' Enumeration flags defining the file format supported loading and saving
'Enum IRR_MESH_FILE_FORMAT
Const EMWT_IRR_MESH = 0            ' Irrlicht Native mesh writer, for static .irrmesh files.  
Const EMWT_COLLADA = 1                 ' COLLADA mesh writer for .dae and .xml files.  
Const EMWT_STL = 2                     ' STL mesh writer for .stl files.  

' Enumeration flags defining the size of a patch in the terrain
'Enum IRR_TERRAIN_PATCH_SIZE
Const ETPS_9 = 9                    ' patch size of 9, at most, use 4 levels of detail with this patch size.  
Const ETPS_17 = 17                  ' patch size of 17, at most, use 5 levels of detail with this patch size.  
Const ETPS_33 = 33                  ' patch size of 33, at most, use 6 levels of detail with this patch size.  
Const ETPS_65 = 65                  ' patch size of 65, at most, use 7 levels of detail with this patch size.  
Const ETPS_129 = 129                ' patch size of 129, at most, use 8 levels of detail with this patch size. 

' Enumeration flags telling the video driver in which format textures should be created. 
'Enum IRR_TEXTURE_CREATION_FLAG
Const ETCF_ALWAYS_16_BIT          = &h1	 ' Forces the driver to create 16 bit textures always, independent of which format the file on disk has. When choosing this you may loose some color detail, but gain much speed and memory. 16 bit textures can be transferred twice as fast as 32 bit textures and only use half of the space in memory. When using this flag, it does not make sense to use the flags ETCF_ALWAYS_32_BIT, ETCF_OPTIMIZED_FOR_QUALITY, or ETCF_OPTIMIZED_FOR_SPEED at the same time.  
Const ETCF_ALWAYS_32_BIT          = &h2  ' Forces the driver to create 32 bit textures always, independent of which format the file on disk has. Please note that some drivers (like the software device) will ignore this, because they are only able to create and use 16 bit textures. When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_OPTIMIZED_FOR_QUALITY, or ETCF_OPTIMIZED_FOR_SPEED at the same time.  
Const ETCF_OPTIMIZED_FOR_QUALITY  = &h4  ' Lets the driver decide in which format the textures are created and tries to make the textures look as good as possible. Usually it simply chooses the format in which the texture was stored on disk. When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_ALWAYS_32_BIT, or ETCF_OPTIMIZED_FOR_SPEED at the same time.  
Const ETCF_OPTIMIZED_FOR_SPEED    = &h8  ' Lets the driver decide in which format the textures are created and tries to create them maximizing render speed. When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_ALWAYS_32_BIT, or ETCF_OPTIMIZED_FOR_QUALITY, at the same time.  
Const ETCF_CREATE_MIP_MAPS        = &h10 ' Automatically creates mip map levels for the textures.  
Const ETCF_NO_ALPHA_CHANNEL       = &h20 ' Discard any alpha2 layer and use non-alpha2 color format.  
Const ETCF_ALLOW_NON_POWER_2      = &h40 ' Allow non power of two dimention textures

' A color format specifies how color information is stored
'Enum IRR_COLOR_FORMAT
Const ECF_A1R5G5B5 = 0    		' 16 bit color format used by the software driver, and thus preferred by all other irrlicht engine video drivers. There are 5 bits for every color component, and a single bit is left for alpha2 information.  
Const ECF_R5G6B5 = 1			' Standard 16 bit color format.  
Const ECF_R8G8B8 = 2			' 24 bit color, no alpha2 channel, but 8 bit for red, green and blue.  
Const ECF_A8R8G8B8 = 3			' Default 32 bit color format. 8 bits are used for every component: red, green, blue and alpha.  

'Enum IRR_TEXTURE_BLEND
Const BLEND_SCREEN = 0
Const BLEND_ADD = 1
Const BLEND_SUBTRACT = 2
Const BLEND_MULTIPLY = 3
Const BLEND_DIVIDE = 4

'Enum IRR_COLOR_MATERIAL
Const ECM_NONE = 0            		' Dont use vertex color for lighting
Const ECM_DIFFUSE = 1				' Use vertex color for diffuse light, (default)
Const ECM_AMBIENT = 2				' Use vertex color for ambient light
Const ECM_EMISSIVE = 3				' Use vertex color for emissive light
Const ECM_SPECULAR = 4				' Use vertex color for specular light
Const ECM_DIFFUSE_AND_AMBIENT = 5	' Use vertex color for both diffuse and ambient light

'Enum IRR_DEBUG
Const EDS_OFF = 0
Const EDS_BBOX = 1
Const EDS_NORMALS = 2
Const EDS_SKELETON = 4
Const EDS_MESH_WIRE_OVERLAY = 8
Const EDS_HALF_TRANSPARENCY = 16
Const EDS_BBOX_BUFFERS = 32
Const EDS_FULL = &hffffffff

'Enum IRR_EGUI_EVENT_TYPE
Const EGET_ELEMENT_FOCUS_LOST = 0    ' A gui element has lost its focus.
Const EGET_ELEMENT_FOCUSED = 1    ' A gui element has got the focus.
Const EGET_ELEMENT_HOVERED = 2    ' The mouse cursor hovered over a gui element.
Const EGET_ELEMENT_LEFT  = 3    ' The mouse cursor left the hovered element.
Const EGET_ELEMENT_CLOSED = 4    ' An element would like to close.
Const EGET_BUTTON_CLICKED = 5    ' A button was clicked.
Const EGET_SCROLL_BAR_CHANGED = 6    ' A scrollbar has changed its position.
Const EGET_CHECKBOX_CHANGED = 7    ' A checkbox has changed its check state.
Const EGET_LISTBOX_CHANGED = 8    ' A new item in a listbox was seleted.
Const EGET_LISTBOX_SELECTED_AGAIN = 9    ' An item in the listbox was selected, which was already selected.
Const EGET_FILE_SELECTED = 10    ' A file has been selected in the file dialog
Const EGET_DIRECTORY_SELECTED = 11    ' A directory has been selected in the file dialog
Const EGET_FILE_CHOOSE_DIALOG_CANCELLED = 12    ' A file open dialog has been closed without choosing a file
Const EGET_MESSAGEBOX_YES = 13    ' 'Yes' was clicked on a messagebox
Const EGET_MESSAGEBOX_NO = 14    ' 'No' was clicked on a messagebox
Const EGET_MESSAGEBOX_OK = 15    ' 'OK' was clicked on a messagebox
Const EGET_MESSAGEBOX_CANCEL = 16    ' 'Cancel' was clicked on a messagebox
Const EGET_EDITBOX_ENTER = 17    ' In an editbox 'ENTER' was pressed
Const EGET_EDITBOX_CHANGED = 18    ' The text in an editbox was changed. This does not include automatic changes in text-breaking.
Const EGET_EDITBOX_MARKING_CHANGED = 19    ' The marked area in an editbox was changed.
Const EGET_TAB_CHANGED = 20    ' The tab was changed in an tab control
Const EGET_MENU_ITEM_SELECTED = 21    ' A menu item was selected in a (context) menu
Const EGET_COMBO_BOX_CHANGED = 22    ' The selection in a combo box has been changed
Const EGET_SPINBOX_CHANGED = 23    ' The value of a spin box has changed
Const EGET_TABLE_CHANGED = 24    ' A table has changed
Const EGET_TABLE_HEADER_CHANGED = 25
Const EGET_TABLE_SELECTED_AGAIN = 26
Const EGET_TREEVIEW_NODE_DESELECT = 27    ' A tree view node lost selection. See IGUITreeView::getLastEventNode().
Const EGET_TREEVIEW_NODE_SELECT = 28    ' A tree view node was selected. See IGUITreeView::getLastEventNode().
Const EGET_TREEVIEW_NODE_EXPAND = 29    ' A tree view node was expanded. See IGUITreeView::getLastEventNode().
Const EGET_TREEVIEW_NODE_COLLAPS = 30    ' A tree view node was collapsed. See IGUITreeView::getLastEventNode().
Const EGET_COUNT = 31    ' No real event. Just for convenience to get number of events

'Enum IRR_GUI_COLOR_ELEMENT
Const EGDC_3D_DARK_SHADOW = 0     ' Dark shadow for three-dimensional display elements.  
Const EGDC_3D_SHADOW = 1              ' Shadow color for three-dimensional display elements (for edges facing away from the light source).  
Const EGDC_3D_FACE = 2                ' Face color for three-dimensional display elements and for dialog box backgrounds.  
Const EGDC_3D_HIGH_LIGHT = 3          ' Highlight color for three-dimensional display elements (for edges facing the light source.).  
Const EGDC_3D_LIGHT = 4               ' Light color for three-dimensional display elements (for edges facing the light source.).  
Const EGDC_ACTIVE_BORDER = 5         ' Active window border.  
Const EGDC_ACTIVE_CAPTION = 6        ' Active window title bar text.  
Const EGDC_APP_WORKSPACE = 7         ' Background color of multiple document interface (MDI) applications.  
Const EGDC_BUTTON_TEXT = 8          ' Text on a button.  
Const EGDC_GRAY_TEXT = 9            ' Grayed (disabled) text.  
Const EGDC_HIGH_LIGHT = 10           ' Item(s) selected in a control.  
Const EGDC_HIGH_LIGHT_TEXT = 11       ' Text of item(s) selected in a control.  
Const EGDC_INACTIVE_BORDER = 12       ' Inactive window border.  
Const EGDC_INACTIVE_CAPTION = 13      ' Inactive window caption.  
Const EGDC_TOOLTIP = 14               ' Tool tip text color.  
Const EGDC_TOOLTIP_BACKGROUND = 15    ' Tool tip background color.  
Const EGDC_SCROLLBAR = 16             ' Scrollbar gray area.  
Const EGDC_WINDOW = 17                ' Window background.  
Const EGDC_WINDOW_SYMBOL = 18         ' Window symbols like on close buttons, scroll bars and check boxes.  
Const EGDC_ICON = 19                  ' Icons in a list or tree.  
Const EGDC_ICON_HIGH_LIGHT = 20       ' Selected icons in a list or tree.  
Const EGDC_COUNT = 21                 ' this value is not used, it only specifies the amount of default colors available.  

' ////////////////////////////////////////////////////////////////////////////
' Constant Definitions

' No value, usually used when you do not wish to pass an object to a call
Const IRR_NO_OBJECT = 0

' Parenting of nodes
Const IRR_NO_PARENT = 0

Const IRR_LINEAR_FOG = 0
Const IRR_EXPONENTIAL_FOG = 1

' Filing system definitions
Const IRR_USE_CASE = 0
Const IRR_IGNORE_CASE = 1
Const IRR_USE_PATHS = 0
Const IRR_IGNORE_PATHS = 1

' 2D image definitions
Const IRR_IGNORE_alpha2 = 0
Const IRR_USE_alpha2 = 1

' Node definitions
Const IRR_INVISIBLE = 0
Const IRR_VISIBLE = 1

' Flag definition
Const IRR_OFF = 0
Const IRR_ON = 1

Const IRR_ONE_SHOT = 0
Const IRR_LOOP = 1

' Particle definitions
Const IRR_NO_EMITTER = 0
Const IRR_DEFAULT_EMITTER = 1

Const IRR_ATTRACT = 1
Const IRR_REPEL = 0

' GUI Interface definitions
Const IRR_GUI_NO_BORDER = 0
Const IRR_GUI_BORDER = 1
Const IRR_GUI_NO_WRAP = 0
Const IRR_GUI_WRAP = 1
Const IRR_GUI_HORIZONTAL = 1
Const IRR_GUI_VERTICAL = 0
Const IRR_GUI_MODAL = 1
Const IRR_GUI_NOT_MODAL = 0
Const IRR_GUI_DRAW_BACKGROUND = 1
Const IRR_GUI_EMPTY_BACKGROUND = 0
Const IRR_GUI_PASSWORD = 1
Const IRR_GUI_NOT_PASSWORD = 0

' Spherical Terrain Faces
Const IRR_TOP_FACE = 0
Const IRR_FRONT_FACE = 1
Const IRR_BACK_FACE = 2
Const IRR_LEFT_FACE = 3
Const IRR_RIGHT_FACE = 4
Const IRR_BOTTOM_FACE = 5

' attach a tile onto this tile
Const TOP_EDGE = 0
Const BOTTOM_EDGE = 1
Const LEFT_EDGE = 2
Const RIGHT_EDGE = 3


'Enum EKEY_CODE

Const KEY_LBUTTON          = 1		'&h01  ' Left mouse button  
Const KEY_RBUTTON          = 2  	'&h02  ' Right mouse button  
Const KEY_CANCEL           = 3  	'&h03  ' Control-break processing  
Const KEY_MBUTTON          = 4  	'&h04  ' Middle mouse button (three-button mouse)  
Const KEY_XBUTTON1         = 5  	'&h05  ' Windows 2000/XP: X1 mouse button 
Const KEY_XBUTTON2         = 6  	'&h06  ' Windows 2000/XP: X2 mouse button
 
Const KEY_BACK             = 8		'&h08  ' BACKSPACE key  
Const KEY_TAB              = 9		'&h09  ' Tab key
 
Const KEY_CLEAR            = 12		'&h0C  ' Clear key  
Const KEY_RETURN           = 13		'&h0D  ' ENTER key 
 
Const KEY_SHIFT            = 16		'&h10  ' SHIFT key  
Const KEY_CONTROL          = 17		'&h11  ' CTRL key  
Const KEY_MENU             = 18		'&h12  ' ALT key  
Const KEY_PAUSE            = 19		'&h13  ' PAUSE key  
Const KEY_CAPITAL          = 20		'&h14  ' CAPS Lock key
Const KEY_KANA             = 21		'&h15  ' IME Kana mode 
Const KEY_HANGUEL          = 21		'&h15  ' IME Hanguel mode (maintained For compatibility use KEY_HANGUL) 
Const KEY_HANGUL           = 21		'&h15  ' IME Hangul mode 
Const KEY_JUNJA            = 23		'&h17  ' IME Junja mode 
Const KEY_FINAL            = 24		'&h18  ' IME final mode 
Const KEY_HANJA            = 25		'&h19  ' IME Hanja mode 
Const KEY_KANJI            = 25		'&h19  ' IME Kanji mode   

Const KEY_ESCAPE           = 27		'&h1B  ' ESC key  
Const KEY_CONVERT          = 28		'&h1C  ' IME convert 
Const KEY_NONCONVERT       = 29		'&h1D  ' IME nonconvert 
Const KEY_ACCEPT           = 30		'&h1E  ' IME accept 
Const KEY_MODECHANGE       = 31		'&h1F  ' IME mode change request 
Const KEY_SPACE            = 32		'&h20  ' SPACEBAR  
Const KEY_PRIOR            = 33		'&h21  ' PAGE UP key  
Const KEY_NEXT             = 34		'&h22  ' PAGE DOWN key  
Const KEY_END              = 35		'&h23  ' End key  
Const KEY_HOME             = 36		'&h24  ' HOME key  
Const KEY_LEFT             = 37		'&h25  ' Left ARROW key  
Const KEY_UP               = 38		'&h26  ' UP ARROW key  
Const KEY_RIGHT            = 39		'&h27  ' Right ARROW key  
Const KEY_DOWN             = 40		'&h28  ' DOWN ARROW key  
Const KEY_SELECT           = 41		'&h29  ' Select key  
Const KEY_PRINT            = 42		'&h2A  ' Print key
Const KEY_EXECUT           = 43		'&h2B  ' EXECUTE key  
Const KEY_SNAPSHOT         = 44		'&h2C  ' Print Screen key  
Const KEY_INSERT           = 45		'&h2D  ' INS key  
Const KEY_DELETE           = 46		'&h2E  ' DEL key  
Const KEY_HELP             = 47		'&h2F  ' HELP key  
Const KEY_KEY_0            = 48		'&h30  ' 0 key  
Const KEY_KEY_1            = 49		'&h31  ' 1 key  
Const KEY_KEY_2            = 50		'&h32  ' 2 key  
Const KEY_KEY_3            = 51		'&h33  ' 3 key  
Const KEY_KEY_4            = 52		'&h34  ' 4 key  
Const KEY_KEY_5            = 53		'&h35  ' 5 key  
Const KEY_KEY_6            = 54		'&h36  ' 6 key  
Const KEY_KEY_7            = 55		'&h37  ' 7 key  
Const KEY_KEY_8            = 56		'&h38  ' 8 key  
Const KEY_KEY_9            = 57		'&h39  ' 9 key 
 
Const KEY_KEY_A            = 65		'&h41  ' A key  
Const KEY_KEY_B            = 66		'&h42  ' B key  
Const KEY_KEY_C            = 67		'&h43  ' C key  
Const KEY_KEY_D            = 68		'&h44  ' D key  
Const KEY_KEY_E            = 69		'&h45  ' E key  
Const KEY_KEY_F            = 70		'&h46  ' F key  
Const KEY_KEY_G            = 71		'&h47  ' G key  
Const KEY_KEY_H            = 72		'&h48  ' H key  
Const KEY_KEY_I            = 73		'&h49  ' I key  
Const KEY_KEY_J            = 74		'&h4A  ' J key  
Const KEY_KEY_K            = 75		'&h4B  ' K key  
Const KEY_KEY_L            = 76		'&h4C  ' L key  
Const KEY_KEY_M            = 77		'&h4D  ' M key  
Const KEY_KEY_N            = 78		'&h4E  ' N key  
Const KEY_KEY_O            = 79		'&h4F  ' O key  
Const KEY_KEY_P            = 80		'&h50  ' P key  
Const KEY_KEY_Q            = 81		'&h51  ' Q key  
Const KEY_KEY_R            = 82		'&h52  ' R key  
Const KEY_KEY_S            = 83		'&h53  ' S key  
Const KEY_KEY_T            = 84		'&h54  ' T key  
Const KEY_KEY_U            = 85		'&h55  ' U key  
Const KEY_KEY_V            = 86		'&h56  ' V key  
Const KEY_KEY_W            = 87		'&h57  ' W key  
Const KEY_KEY_X            = 88		'&h58  ' X key  
Const KEY_KEY_Y            = 89		'&h59  ' Y key  
Const KEY_KEY_Z            = 90		'&h5A  ' Z key  
Const KEY_LWIN             = 91		'&h5B  ' Left Windows key (Microsoft® Natural® keyboard)  
Const KEY_RWIN             = 92		'&h5C  ' Right Windows key (Natural keyboard)  
Const KEY_APPS             = 93		'&h5D  ' Applications key (Natural keyboard)  
Const KEY_SLEEP            = 95		'&h5F  ' Computer Sleep key 
Const KEY_NUMPAD0          = 96		'&h60  ' Numeric keypad 0 key  
Const KEY_NUMPAD1          = 97		'&h61  ' Numeric keypad 1 key  
Const KEY_NUMPAD2          = 98		'&h62  ' Numeric keypad 2 key  
Const KEY_NUMPAD3          = 99		'&h63  ' Numeric keypad 3 key  
Const KEY_NUMPAD4          = 100	'&h64  ' Numeric keypad 4 key  
Const KEY_NUMPAD5          = 101	'&h65  ' Numeric keypad 5 key  
Const KEY_NUMPAD6          = 102	'&h66  ' Numeric keypad 6 key  
Const KEY_NUMPAD7          = 103	'&h67  ' Numeric keypad 7 key  
Const KEY_NUMPAD8          = 104	'&h68  ' Numeric keypad 8 key  
Const KEY_NUMPAD9          = 105	'&h69  ' Numeric keypad 9 key  
Const KEY_MULTIPLY         = 106	'&h6A  ' Multiply key  
Const KEY_ADD              = 107	'&h6B  ' Add key  
Const KEY_SEPARATOR        = 108	'&h6C  ' Separator key  
Const KEY_SUBTRACT         = 109	'&h6D  ' Subtract key  
Const KEY_DECIMAL          = 110	'&h6E  ' Decimal key  
Const KEY_DIVIDE           = 111	'&h6F  ' Divide key  
Const KEY_F1               = 112	'&h70  ' F1 key  
Const KEY_F2               = 113	'&h71  ' F2 key  
Const KEY_F3               = 114	'&h72  ' F3 key  
Const KEY_F4               = 115	'&h73  ' F4 key  
Const KEY_F5               = 116	'&h74  ' F5 key  
Const KEY_F6               = 117	'&h75  ' F6 key  
Const KEY_F7               = 118	'&h76  ' F7 key  
Const KEY_F8               = 119	'&h77  ' F8 key  
Const KEY_F9               = 120	'&h78  ' F9 key  
Const KEY_F10              = 121	'&h79  ' F10 key  
Const KEY_F11              = 122	'&h7A  ' F11 key  
Const KEY_F12              = 123	'&h7B  ' F12 key  
Const KEY_F13              = 124	'&h7C  ' F13 key  
Const KEY_F14              = 125	'&h7D  ' F14 key  
Const KEY_F15              = 126	'&h7E  ' F15 key  
Const KEY_F16              = 127	'&h7F  ' F16 key  
Const KEY_F17              = 128	'&h80  ' F17 key  
Const KEY_F18              = 129	'&h81  ' F18 key  
Const KEY_F19              = 130	'&h82  ' F19 key  
Const KEY_F20              = 131	'&h83  ' F20 key  
Const KEY_F21              = 132	'&h84  ' F21 key  
Const KEY_F22              = 133	'&h85  ' F22 key  
Const KEY_F23              = 134	'&h86  ' F23 key  
Const KEY_F24              = 135	'&h87  ' F24 key  
Const KEY_NUMLOCK          = 144	'&h90  ' NUM Lock key  
Const KEY_SCROLL           = 145	'&h91  ' SCROLL Lock key  
Const KEY_LSHIFT           = 160	'&hA0  ' Left SHIFT key 
Const KEY_RSHIFT           = 161	'&hA1  ' Right SHIFT key 
Const KEY_LCONTROL         = 162	'&hA2  ' Left CONTROL key 
Const KEY_RCONTROL         = 163	'&hA3  ' Right CONTROL key 
Const KEY_LMENU            = 164	'&hA4  ' Left MENU key 
Const KEY_RMENU            = 165	'&hA5  ' Right MENU key

Const KEY_PLUS             = 187	'&hBB  ' Plus Key   (+)
Const KEY_COMMA            = 188	'&hBC  ' Comma Key  (,)
Const KEY_MINUS            = 189	'&hBD  ' Minus Key  (-)
Const KEY_PERIOD           = 190	'&hBE  ' Period Key (.)

Const KEY_ATTN             = 246	'&hF6  ' Attn key 
Const KEY_CRSEL            = 247	'&hF7  ' CrSel key 
Const KEY_EXSEL            = 248	'&hF8  ' ExSel key 
Const KEY_EREOF            = 249	'&hF9  ' Erase Eof key 
Const KEY_PLAY             = 250	'&hFA  ' Play key 
Const KEY_ZOOM             = 251	'&hFB  ' Zoom key 
Const KEY_PA1              = 253	'&hFD  ' PA1 key 
Const KEY_OEM_CLEAR        = 254	'&hFE  ' Clear key 
Const KEY_KEY_CODES_COUNT  = 255	'&hFF  ' this Is Not a key but the amount of keycodes there are.



' ----------------------------------------------------------------------------
' 					IRRKLANG CONSTANTS
' ----------------------------------------------------------------------------

'E_STREAM_MODE
Const ESM_AUTO_DETECT = 0
Const ESM_STREAMING = 1
Const ESM_NO_STREAMING = 2
Const ESM_FORCE_32_BIT = &h7fffffff











'