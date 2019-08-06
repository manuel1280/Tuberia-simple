VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} TubSimpl 
   Caption         =   "Comprobacion de diseño Tuberia Simple"
   ClientHeight    =   5655
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   12090
   OleObjectBlob   =   "TubSimpl.frx":0000
   StartUpPosition =   1  'Centrar en propietario
End
Attribute VB_Name = "TubSimpl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub BotCalcular_Click()
    Dim d, H, H2, p, u, z2, L, v As Double
    Dim f As Single
    Dim Ks, Ksf, Km, e, Hm, pot As Integer
    Dim Re As Long
    
    
    d = Val(TextD.Text)
    p = Val(TextP.Text)
    u = Val(TextU.Text)
    L = Val(TextL.Text)
    Ks = Val(TextRug.Text)
    pot = Val(TextPotencia.Text)
    e = Val(TextE.Text)
    Km = Val(TextKm.Text)
    H = Val(TextH.Text)
    z2 = Val(TextZ2.Text)
    
    
    
    Dim Ht, error, Q As Single
    Dim i As Integer
    Dim resuleto As Boolean
    resuelto = True
    Ht = H - z2
    Ksf = Ks * 10 ^ (pot)
    
    listbox.AddItem ("i       V        Hf        Hf+1       Hm            error")
    While (resuelto)
        
        i = i + 1
        v = ((-2 * Sqr(2 * 9.8 * d * Ht)) / Sqr(L)) * ((log((Ksf / 3.7 * d) + ((2.51 * u / p) * Sqr(L)) / (d * Sqr(2 * 9.8 * d * Ht)))) / log(10))

        H2 = H - (Km * (v ^ (2)) / (2 * 9.81))
        Hm = H - H2
       
        error = Abs(Ht - H2)
        
        listbox.AddItem i & " ; " & v & " ; " & Ht & " ; " & H2 & " ; " & Hm & " ; " & error
        
        '   cout<<"\t"<<i<<"\t"<<V<<"\t"<<Ht<<"\t"<<H2<<"\t"<<Hm<<"\t"<<f<<"\t"<<error<<endl;'
        Ht = H2
        If error <= e Then
           resuelto = False
           End If
         Wend
         Q = 4.653 * 3.1416 * ((d ^ (2)) / 4) * 1000
         f = (2 * 9.8 * d * H2) / (L * v ^ (2))
         Re = (p * d * v) / u
         
         TextBoxQ.Visible = True
         TextBoxF.Visible = True
         TextBoxRe.Visible = True
         
         TextBoxQ.Text = Q
         TextBoxF.Text = f
         TextBoxRe.Text = Re
         
        If Re <= 2000 Then
        lblResult.Caption = "El flujo es laminar"
        Else
        If Re > 2000 And Re <= 4500 Then
        lblResult.Caption = "El flujo es critico"
        Else
        If Re > 2000 Then
        lblResult.Caption = "El flujo es turbulento"
       End If
       End If
       End If
                
End Sub

Private Sub CommandButton1_Click()

End Sub

Private Sub cmdBorr_Click()
    TextD.Text = " "
    TextH.Text = " "
    TextP.Text = " "
    TextU.Text = " "
    TextZ2.Text = " "
    TextL.Text = " "
    TextRug.Text = " "
    TextPotencia.Text = " "
    TextKm.Text = " "
    TextE.Text = " "
    TextBoxF = " "
    TextBoxQ = " "
    TextBoxRe = " "
    listbox.Clear
    lblResult.Caption = "  "
    TextBoxQ.Visible = False
    TextBoxF.Visible = False
    TextBoxRe.Visible = False
    
    
    
End Sub

Public Sub TextBox1_Change()

End Sub

Public Sub TextBox2_Change()

End Sub

Public Sub TextBox3_Change()

End Sub

Public Sub TextBox4_Change()

End Sub

Public Sub TextBox5_Change()

End Sub

Public Sub TextBox6_Change()

End Sub

Public Sub TextBox7_Change()

End Sub

Public Sub TextBox8_Change()

End Sub

Private Sub CmdBotnSalir_Click()
If MsgBox("¿Desea salir?", vbQuestion + vbYesNo, Salir) = vbYes Then
End
End If
End Sub

Private Sub cmdCorregir_Click()
    TextBoxF = " "
    TextBoxQ = " "
    TextBoxRe = " "
    listbox.Clear
    lblResult.Caption = "  "
    TextBoxQ.Visible = False
    TextBoxF.Visible = False
    TextBoxRe.Visible = False
    
End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Label15_Click()

End Sub

Private Sub Label6_Click()

End Sub

Private Sub TextBoxQ_Change()

End Sub

Public Sub TextD_Change()

End Sub

Private Sub TextPotencia_Change()

End Sub

Private Sub UserForm_Click()

End Sub
