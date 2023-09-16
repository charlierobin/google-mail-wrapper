#tag Module
Protected Module TextFiles
	#tag Method, Flags = &h1
		Protected Function load(f as FolderItem) As String
		  var data as String = ""
		  
		  try
		    
		    var t as TextInputStream = TextInputStream.Open( f )
		    
		    t.Encoding = Encodings.UTF8
		    
		    data = t.ReadAll()
		    
		    t.Close()
		    
		  catch e as IOException
		    
		    // System.DebugLog( "Error reading file: " + f.Name + " " + e.Message )
		    
		  catch e as RuntimeException
		    
		    // System.DebugLog( "Error reading file: " + f.Name + " " + e.Message )
		    
		  end try
		  
		  return data
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub safeSave(f as FolderItem, data as String)
		  try
		    
		    var output as TextOutputStream = TextOutputStream.Create( f )
		    
		    output.Write( ConvertEncoding( data, Encodings.UTF8 ) )
		    
		    output.Close()
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		  catch e as IOException
		    
		    MessageBox( "Error writing: " + e.Message )
		    
		  catch e as RuntimeException
		    
		    MessageBox( "Error writing: " + e.Message )
		    
		  end try
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub save(f as FolderItem, data as String)
		  try
		    
		    var output as TextOutputStream = TextOutputStream.Create( f )
		    
		    output.Write( ConvertEncoding( data, Encodings.UTF8 ) )
		    
		    output.Close()
		    
		  catch e as IOException
		    
		    MessageBox( "Error writing: " + e.Message )
		    
		  catch e as RuntimeException
		    
		    MessageBox( "Error writing: " + e.Message )
		    
		  end try
		  
		  
		  
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
