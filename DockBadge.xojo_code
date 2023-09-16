#tag Module
Protected Module DockBadge
	#tag Method, Flags = &h1
		Protected Sub clear()
		  DockBadge.set( "" )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(s as String)
		  declare function NSClassFromString lib "Foundation" ( ClassName As CFStringRef ) as Ptr
		  declare function sharedApplication lib "AppKit" selector "sharedApplication" ( classRef as Ptr ) as Ptr
		  declare function getDockTile lib "AppKit" selector "dockTile" ( NSApplicationInstance as Ptr ) as Ptr
		  declare sub setBadgeLabel lib "AppKit" selector "setBadgeLabel:" ( NSDockTileInstance as Ptr, NSStringValue as CFStringRef ) 
		  declare sub setShowsApplicationBadge lib "AppKit" selector "setShowsApplicationBadge:" ( id as Ptr, value as Boolean )
		  
		  var oSharedApplication as Ptr = sharedApplication( NSClassFromString( "NSApplication" ) )
		  
		  var oDockTile as Ptr = getDockTile( oSharedApplication )
		  
		  if s <> "" then
		    
		    setBadgeLabel( oDockTile, s )
		    
		    setShowsApplicationBadge( oDockTile, true )
		    
		  else
		    
		    setBadgeLabel( oDockTile, "" )
		    
		    setShowsApplicationBadge( oDockTile, false )
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
