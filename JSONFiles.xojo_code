#tag Module
Protected Module JSONFiles
	#tag Method, Flags = &h1
		Protected Function load(f as FolderItem) As JSONItem
		  var json as JSONItem = nil
		  
		  var data as String = TextFiles.load( f )
		  
		  json = new JSONItem( data )
		  
		  return json
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub safeSave(f as FolderItem, json as JSONItem)
		  var data as String = json.ToString
		  
		  TextFiles.safeSave( f, data )
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub save(f as FolderItem, json as JSONItem)
		  var data as String = json.ToString
		  
		  TextFiles.save( f, data )
		  
		  
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
