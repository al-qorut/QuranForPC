object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Al-Qur'#39'an'
  ClientHeight = 552
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 533
    Width = 969
    Height = 19
    Panels = <
      item
        Text = 'Shortcut <, >, F1 ~  F4'
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 969
    Height = 533
    Align = alClient
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 967
      Height = 471
      Align = alClient
      TabOrder = 0
      OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
      OnNavigateComplete2 = WebBrowser1NavigateComplete2
      OnDocumentComplete = WebBrowser1DocumentComplete
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000F1630000AE3000000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Panel3: TPanel
      Left = 1
      Top = 472
      Width = 967
      Height = 60
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        967
        60)
      object SpeedButton1: TSpeedButton
        Left = 446
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton3: TSpeedButton
        Left = 404
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8CCEFC582E7A945E39B27E6A530E6A5
          30E39B27E7A945EFC582F8E8CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDD8E0992BE6A837EEC75CF3D675
          F7DD82F6DD82F6DC81F6DD82F3D675EEC75CE6A837E0992BFAEDD8FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECBF81DF992BF0CF65F7
          DC7FF6D87AF6D778F7D97AF5D371F6D979F5D677F6D778F6D87AF7DC7FF0CF65
          DF992BECBF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6B36FE3A5
          36F5D778F4D476F3D373F3D474F5D878F6D368B54D00F9DE7BF3D373F3D373F3
          D373F3D373F4D476F5D778E3A536E6B36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E8B980E09F33F4D778F2D170F2D06FF2D170F5D675F0C356A54605B54D00FADF
          7AF2D06FF2D06FF2D06FF2D06FF2D06FF2D170F4D778E09F33E8B980FFFFFFFF
          FFFFFFFFFFF7E9D7D78822F3D16CF3CD6AF2CC69F3CD6AF5D36FEDBF52B54D00
          F3EACDB54D00FBDB73F2CC69F2CC69F2CC69F2CC69F2CC69F2CC69F3CD6AF3D1
          6CD78822F7E9D7FFFFFFFFFFFFCF7C22EBBE55F1CB67F0C964F0CA65F4D16BE1
          A33BA54605EAD8B6FFFFFFB54D00FBDC71F3CF69F3CF69F3CF69F3CF69F3CF69
          F3CF69F2CE68F1CC67EBBE55CF7C22FFFFFFF3DEC8D68927F1CA63EEC45DEEC5
          5EF2CC63DA952FB05811E9D8B9FFFFFFFFFFFFB54D00B54D00B54D00B54D00B5
          4D00B54D00B54D00B54D00B54D00F1CA61F1CA63D68927F3DEC8DFAC78E3A93D
          EEC358EEC157F2C85CDA9430B05811FBFEFBFFFFFFFFFFFFFFFFFFDAB581DCB8
          8BDBB78ADCB98BDCB98BDDBA8BDDBA8EE2C599A13A00F3CA5CEEC358E3A93DDF
          AC78CA7B34ECBF5FEDB950F2C257DA9430BF7730FBFEFCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA94400F2C1
          57ECB84FECBF5FCA7B34BF620EF5DC93F1C860DA9430BF7730FAFDFAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB04A00EEBB4CECBF5AF5DC93BF620EBF6515F4D888D09247BF7730FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB54D00EDC156EFCD81F2D485C16817B86013F2D682
          E2B362B9712EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC97F22EFD17EECCA77F1D380B7
          5F13AC4A07EFCC76EFC972E2AE58BF7426F4F0E5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4963DEEC7
          72ECC46FEECC75AC4A07B76429E7C172EBC267ECC56BE0A953C57824F2E6D7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD89941EBC46AEBC167E7C172B76429CE9670D19543EFD288E7BC5DE9C0
          62E6BC5FC87E27F0E9D8FFFFFFFFFFFFFFFFFFEEDDBCF1E1C7F0E1C5F0E1C5F1
          E0C5F1E2C6F3E2C6F3E6CDDA9D44E9BE5DEFD288D19543CE9670EAD3C4B05811
          F0D695EAC26BE7B755E8BA5AE6B756CE862CF3E8DAFFFFFFFFFFFFCA7B20DCA4
          41DEA144DEA444DEA444DEA644DEA644DEA646DDA445EBC36CF0D695B05811EA
          D3C4FFFFFFA2440BD69E4BF0D991EAC671E4B44DE5B54FE4B34FD28F31F5EBDC
          FFFFFFD08B2EE7B953E6B651E6B651E6B651E6B651E5B54FE4B64EEBC873F0D9
          92D69E4BA2440BFFFFFFFFFFFFEEDED3A14307E4BB67EFD187EBCC7CE7BA58E4
          AF3FE1AB41CE8527F9F4EED7993EE5B244E4B144E4B043E3B042E3AE3FE7BA58
          EBCC7CEFD187E4BB67A14307EEDED3FFFFFFFFFFFFFFFFFFC6906EAD5512E6BF
          6DEDCF7DEBCC7CEAC773E8BE5EE3B74BD08427D08427E1A836E1AC3BE3B148E7
          BD5EEAC773EBCC7CEDCF7DE6BF6DAD5512C6906EFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBB7C58AC540FE0B159EBCA72EACB72EACA72EACB73EBC871EBC368EACB
          75EACB74EACB73EACA72EACB72EBCA72E0B159AC540FBB7C58FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC08B6B973801D09039E5BB60E8C96BE9C66C
          E8C56BE9C469E8C46AE8C56AE9C66CE8C96BE5BB60D09039973801C08B6BFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECDBD0903505A2
          4809C27826D8A246E2B45AE6BF64E7BF64E2B45AD8A246C27826A24809903505
          ECDBD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4CEC0BD8668A24809953900953900953900953900A24809BD
          8668E4CEC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 531
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8CCEFC582E7A945E39B27E6A530E6A5
          30E39B27E7A945EFC582F8E8CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDD8E0992BE6A837EEC75CF3D675
          F6DD82F6DC81F6DD82F7DD82F3D675EEC75CE6A837E0992BFAEDD8FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECBF81DF992BF0CF65F7
          DC7FF6D87AF6D778F5D677F6D979F5D371F7D97AF6D778F6D87AF7DC7FF0CF65
          DF992BECBF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6B36FE3A5
          36F5D778F4D476F3D373F3D373F3D373F3D373F9DE7BA54605F6D368F5D878F3
          D474F3D373F4D476F5D778E3A536E6B36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E8B980E09F33F4D778F2D170F2D06FF2D06FF2D06FF2D06FF2D06FFADF7AA546
          05A54605F0C356F5D675F2D170F2D06FF2D170F4D778E09F33E8B980FFFFFFFF
          FFFFFFFFFFF7E9D7D78822F3D16CF3CD6AF2CC69F2CC69F2CC69F2CC69F2CC69
          F2CC69FBDB73A54605F3EACDA54605EDBF52F5D36FF3CD6AF2CC69F3CD6AF3D1
          6CD78822F7E9D7FFFFFFFFFFFFCF7C22EBBE55F1CC67F2CE68F3CF69F3CF69F3
          CF69F3CF69F3CF69F3CF69FBDC71A54605FFFFFFEAD8B6A54605E1A33BF4D16B
          F0CA65F0C964F1CB67EBBE55CF7C22FFFFFFF3DEC8D68927F1CA63F1CA61D084
          27D08322CE8020CE801FCD7E1FCD7E1ECD7D1ED08321B54D00FFFFFFFFFFFFE9
          D8B9A54605DA952FF2CC63EEC55EEEC45DF1CA63D68927F3DEC8DFAC78E3A93D
          EEC358F3CA5CA13A00E2C599DDBA8EDDBA8BDCB98BDCB98BDBB78ADCB88BDAB5
          81FFFFFFFFFFFFFFFFFFFBFEFBA54605DA9430F2C85CEEC157EEC358E3A93DDF
          AC78CA7B34ECBF5FECB84FF2C157A94400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFCA54605CB7A20F2C2
          57EDB950ECBF5FCA7B34BF620EF5DC93ECBF5AEEBB4CB04A00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FAFDFAB66115BE6412F1C860F5DC93BF620EC16817F2D485EFCD81EDC156B54D
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7730D09247F4D888BF6515B75F13F1D380
          ECCA77EFD17EC97F22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9712EE2B362F2D682B8
          6013AC4A07EECC75ECC46FEEC772D4963DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0E5BF7426E2AE
          58EFC972EFCC76AC4A07B76429E7C172EBC167EBC46AD89941FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E6D7
          C57824E0A953ECC56BEBC267E7C172B76429CE9670D19543EFD288E9BE5DDA9D
          44F3E6CDF3E2C6F1E2C6F1E0C5F0E1C5F0E1C5F1E1C7EEDDBCFFFFFFFFFFFFFF
          FFFFF0E9D8C87E27E6BC5FE9C062E7BC5DEFD288D19543CE9670EAD3C4B05811
          F0D695EBC36CDDA445DEA646DEA644DEA644DEA444DEA444DEA144DCA441CA7B
          20FFFFFFFFFFFFF3E8DACE862CE6B756E8BA5AE7B755EAC26BF0D695B05811EA
          D3C4FFFFFFA2440BD69E4BF0D992EBC873E4B64EE5B54FE6B651E6B651E6B651
          E6B651E7B953D08B2EFFFFFFF5EBDCD28F31E4B34FE5B54FE4B44DEAC671F0D9
          91D69E4BA2440BFFFFFFFFFFFFEEDED3A14307E4BB67EFD187EBCC7CE7BA58E3
          AE3FE3B042E4B043E4B144E5B244D7993EF9F4EECE8527E1AB41E4AF3FE7BA58
          EBCC7CEFD187E4BB67A14307EEDED3FFFFFFFFFFFFFFFFFFC6906EAD5512E6BF
          6DEDCF7DEBCC7CEAC773E7BD5EE3B148E1AC3BE1A836E1A94ED08427E3B74BE8
          BE5EEAC773EBCC7CEDCF7DE6BF6DAD5512C6906EFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBB7C58AC540FE0B159EBCA72EACB72EACA72EACB73EACB74EACB75EBC3
          68EBC871EACB73EACA72EACB72EBCA72E0B159AC540FBB7C58FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC08B6B973801D09039E5BB60E8C96BE9C66C
          E8C56AE8C46AE9C469E8C56BE9C66CE8C96BE5BB60D09039973801C08B6BFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECDBD0903505A2
          4809C27826D8A246E2B45AE7BF64E6BF64E2B45AD8A246C27826A24809903505
          ECDBD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4CEC0BD8668A24809953900953900953900953900A24809BD
          8668E4CEC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 489
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          F4D199F5CC6EF2C561F0C35DEFBA58ECB753ECB44DEAB047E9AC41E7A83AE5A2
          34E49F2EE09824DD9120D88C18D68710D4820AD28005D58101D6A784FFFFFFFF
          FFFFFFFFFFFFFFFFF3D097FEDE88FCD97DFBD87CFBD57AFAD475FAD371ECCB83
          E6BD6EE4BA6BE2B764E0B15DE6BD69F0B73EECAE33EAA92BE7A523E59E16E89F
          10D5A681FFFFFFFFFFFFFFFFFFFFFFFFF4CF93F4FDFFF4F7FEF4F7FFF5F8FFF6
          F9FFFCFFFFB1B0B677757B7C7B817D7B8178777DB4B6BCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD4A27FFFFFFFFFFFFFFFFFFFFFFFFFF4CF93F0EFEFF0EF
          EFF1F1F0F1F1F1F2F2F1FAFAF9ADAAA97774737D79787D79797A7473B0AEADFF
          FFFFFAFAFAFAFAFAFBFBFBFCFCFCFFFFFFD3A17FFFFFFFFFFFFFFFFFFFFFFFFF
          F4CF93EDECEAEDECEAEEEDECEEEEEDEEEEEEF6F5F6A6A3A2716A697771707871
          70736C6CA9A6A4FBFCFCF5F5F4F6F6F6F6F6F6F7F7F7FFFFFFD4A27FFFFFFFFF
          FFFFFFFFFFFFFFFFF4D093E8E7E6E8E7E6E9E8E7EAE9E8EAEAE9F4F2F29E9C9B
          6A64636F6E6B71706D4E4D4EA4A2A0F9F9F8F2F1F1F3F2F1F4F3F2F4F4F3FCFF
          FFD4A27FFFFFFFFFFFFFFFFFFFFFFFFFF5D093E4E3E2E4E3E2E5E4E3E6E5E4E6
          E6E5EFEEEE979593605E5E6B6867656161433F409D9898F6F5F4EEEEEDEFEEEE
          F0EFEEF1F0EFF1F0EFD4A27FFFFFFFFFFFFFFFFFFFFFFFFFF5D094E1E0DFE1E0
          DFE2E1E0E2E2E1E3E2E2ECEBEA8E8C8A5B5957625F5D63605E5D5C5A93918CF1
          F0EFEAE9E8EAEAE9ECEAEAEDECEAEDECEAD4A27FFFFFFFFFFFFFFFFFFFFFFFFF
          F5D094DCDBDADCDBDADEDCDBDFDCDCE0DEDCE8E8E7868382514F505856565957
          56535152888683EFEEEDE6E5E4E7E6E5E7E6E6E8E7E6E8E7E6D4A27FFFFFFFFF
          FFFFFFFFFFFFFFFFF5D094D9D7D6D9D7D6D9D8D7DAD8D8DBD9D8E5E3E27E7978
          484647504E4E514F4E4A4849827B7AEBEBEAE2E2E1E3E2E2E4E3E2E5E4E3E5E4
          E3D4A37FFFFFFFFFFFFFFFFFFFFFFFFFF6D399D5D3D2D5D3D2D5D4D3D6D5D4D7
          D5D5E0DEDD6D6A6A2F2D2D363535393737312E2E706D6CE6E4E4DFDCDCE0DEDC
          E1DFDEE2E0DFE2E0DFD7A785FFFFFFFFFFFFFFFFFFFFFFFFF2BD5FD1CECDD1CE
          CDD2CFCDD3D1CED3D1CFD7D5D3CFCDCCD7D4D3D8D5D4D8D6D5D8D6D4D2CFCEDD
          DAD9DAD9D8DBDAD9DCDBDADCDDDDDCDDDDBB6F3DFFFFFFFFFFFFFFFFFFECB54D
          E49913DAB063A4A2A0CBCACACDCBCACECCCBD0CECDD4D1D0DAD7D6DCDBD9DEDC
          DBDDDCDBD7D6D5D5D4D3D6D5D4D7D5D5D8D7D7D8D7D7DCAB3EE18E00C06801FF
          FFFFFFFFFFF1C978EFC468E9A121DCAE5FA4A2A0C9C6C6CAC7C6CDC9C9BBBBB8
          898584908B8A918B8A8A8685D8D5D4D2CFCED3D1CFD4D3D3D4D3D3DBAA3BDB84
          00DF8F00BF6802FFFFFFFFFFFFF9E1B8F3D69AF1C874EBAA2FDDB4659D9898C4
          C2C1C7C6C3BBB4B4928D8C989393999493928E8DD4D1D0CDCAC9CCCBCCCCCBCC
          D9A438DC8500DE8D00CF7A03E1C1A9FFFFFFFFFFFFFFFFFFF7DFB8F2D69BF3CD
          7EF0B53DDDB76C9D9898C2BEBDB5B2AF938E8D999493999594938E8ECECDC9C8
          C7C5B8B2B1D7A236DC8500DE8D00D07B04E2C4ADFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6DEB7F2D69DF5D38AF4BA49E0B97393918CAFABAA908C8B9491919592
          92918C8BC8C5C6B8B2B1D7A23CDD8900DE8900D07A01E4C4AEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DCB5F2D7A0F8D990F5C053E2BC78888683
          ABA5A6AEA9A6B0AAA7AEABA99D9898D9AA56E59A11E4990AC4C3B9D6A378FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DAB5F2D7A3F9
          DC9AF7CA61E3C07E888683B7B1B0B8B2B1888683DCB26AEBAC33EAA82DE0DCD5
          C1C8D4DAAA80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF3D8B3F3D9A4FBE09FFBD06CE4C382888683888683DFBC78F5BE50F0
          B845F8F6F8E1E1E2C1C5CDD9A97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D7B2F1D9A2FEE3A9FDD471E2C68AE1C1
          89F9CE68F7CE6CE09C30FFFFFFE2E0DDC1C7CED9A97FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D5B1F1D7A2
          FEE8A9FCD57CFCD67CFAD880E8B551CD894DEDF6FFD5D5D6B4B7BFDAAA7FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEFD2B0F2D6A2FFEBB0FEE291ECBE5BD09051FFFFFFE0DBD1CBBCAA
          B0A593D7A577FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D6B7E9C380E2B76ED18F47FFFFFFFF
          FFFFD19358CF8E53CE8C53CE8C54FFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = Button2Click
      end
      object SpeedButton6: TSpeedButton
        Left = 573
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D5C0BF8440BE83
          3FE9D9C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5BFA7ECDFD1FFFFFFFFFFFF
          BD7416EAC07DE6B971BD7416FFFFFFFFFFFFE6D6C5D4BDA5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA743BE1B065BA
          7015D9C8B9FFFFFF844203CD8B31CD8B31844203FFFFFFD5BFAABD7416E1B065
          AF7C45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB06612F8D8A1D39540BA7015844203AD6310D3933DD3933DBD7416844203BD
          7416D39641F4D39AAA6518FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF8F4B05C68023DBA354DEA95BDFAB5FE0AE64DEAA5DDFAB
          5FE4B56CE3B46BE0AE62DDA859C680239A540AFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBD7416BD7416DFD1C78F4B05D59B47E9BD79E8BB74EFC68A
          F4D298F8D8A0F6D59FF4D39AF1CE90EBC17EEBC17EDAA2519A540AD7C8BDB093
          7FA78060FEFEFEFFFFFFFFFFFFA37B58ECC382D395408F4B05D3933EF1CE90EC
          C381F5D39DFDE4B4FFF4CEFFF6D1FFF6D1FFF1CAFDE4B3FADEAAF1CC8FF2D195
          D398449A540AD39844ECC3819E7653FFFFFFFFFFFFBD7416FADEAAF1CE92EDC5
          84F1CC8FECC381F1CE92FDE4B3FEE5B6DBA354C2791BC2791BDAA251FBDFADFD
          E4B3F9DDA9F1CE90F1CC8FF1CE90F1CE90F2D194804B1EFFFFFFFFFFFFEAE0D7
          BD7416DCA456EEC585ECC382ECC382F4D39AECC381945418A56114BD8547C494
          5AA663178B4F16E9BE7AFADEAAF8D8A0EFC68AF0CB8DDCA455844203F3EDE8FF
          FFFFFFFFFFFFFFFFBAA190C47D1FF9DCA8EAC07DE9BD79E9BD79894F1ABC8344
          FFFFFFFFFFFFFFFFFFFFFFFFB77E3C844C1AEDC584F4D298F1CC8FF8DBA2C37A
          1EBDA595FFFFFFFFFFFFFAF6F3BD7416BD7416E0AE64F5D39DE3B46BE8BD76C3
          7A1EB77C3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB8242C37A1EEDC583
          E8BD77F5D39DE2B266844203C37A1EF4ECE4B26B1DE5B86FE5B86FEFC98AF0CB
          8EDDA859DFAB5FA4641FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA5641FE1B065DFAB5FF1CE90F2D194E6B972E5B86FB76E1AD39540FFF9D6
          F6D59FEFC98AF1CE90D39844D69D4CAB6C2BFCF9F6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAC6C2BDBA354D89F4DF3D196F1CE92F4D39AFFF9D6D2
          923DC69B6ABD7416CB862DF3D196F8DBA2D39641D1903AB46B15FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB76F15D39842D59B47F8DBA5F5D3
          9DC68023B26C1AC8A075FFFFFFFFFFFF7C3C00DDA859FFF0C5DAA252C47D1FC5
          7E21D4AF82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4AF82C88125C88126
          DCA455FFF0C4DCA456C37A1EFFFFFFFFFFFFFFFFFFFFFFFF8B4704DDA859FFEE
          C4F1CE90B06612C2791BB96F14E2C59CFFFFFFFFFFFFFFFFFFFFFFFFE2C59CBB
          7015C57E21BA7015F1CE92FFECC0DDA859C37A1EFFFFFFFFFFFFFFFFFFDEB985
          DDA859FFE8BBFBE2B0FFEEC4DEA95B9D560BBB7015BC7216C3812EDDB37CDDB3
          7CC3812EBC7216BC72169E560BDEAA5DFFEEC4FBE2B0FFECBEE0AE64D5A86CFF
          FFFFFFFFFFC78229FFF9D6FFF1CAF9DCA8FEE6B8FFF6D1DEA95BA1590DA95F0E
          B96F14BB7015BB7015B96F14A95F0EA1590DDEA95BFFF6D1FEE5B6F5D39DFFF0
          C5FFF9D6C9852FFFFFFFFFFFFFF0DABCD89F4DD3943FAE6511D08F37FFECBEFF
          F8D3F2D195D19039AF6511AE6511AE6511AF6511D19039F2D195FFF8D3FFE9BD
          D08F37AE6511CC8A30D69D4AF0DDC1FFFFFFFFFFFFFFFFFFFDFAF6FFFFFFFFFF
          FFB96F14F2D194FFF0C8FFF9D6FFF9D6FFECC0FBE2B0FBE2B0FFECC0FFF9D6FF
          F9D6FFF0C4F5D39DBA7015FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCC8A30FFF0C8FFF9D6F3D196EEC585FFF1CAFFF4CEFFF6
          D0FFF0C8EDC584F2D194FFF9D6FFF4CED08F37FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9A04EFFF9D6F6D59FC47D1FC2771A
          D89F4DFFF9D6FFF9D6DCA455C27619C37A1EF5D39DFFF9D6DAA252FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5CCDEAD64DF
          AF6CFFFFFFFFFFFFCD8B31FFF8D5FFF9D6CF8E35FFFFFFFFFFFFE0B374DEAC62
          F5E5CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DFC1E6B972E7BB74F1DBB9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = Button3Click
      end
      object SpeedButton7: TSpeedButton
        Left = 904
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF995F
          33D7961FDFAE5CEBCD98FBF5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFA96A38D7971FD2901CD2901CD2901CD2901CDFAF5CECD09EFAF2
          E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDDBFA5C0A28A8D90968C4E1AD8991FD2901CD2901CD2901CD2901C
          D2901CD2901CD2901CD59627E5BC6FD1AC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBA7B45864B1F0B101B6F3702D9991FD2901DD2
          901DD2901DD2901DD2901DD2901DD2901DD2901DD5951DA4581FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF834F894E200A0F1B743A
          02DA9920D3901ED3901ED3901ED3901ED3901ED3901ED3901ED3901ED6941DA7
          5D23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FDFFFFFFFFFFFFC38750
          8D5122090F1B783D02DB9921D4911FD4911FD4911FD4911FD4911FD4911FD491
          1FD4911FD7951EAA6125FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1513CDFF
          FFFFFFFFFFD0924E8D5525090F1B7B4102DB9A23D49220D49220D49220D49220
          D49220D49220D49220D49220D7961FAD6528FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF1513CD1B1BE4FFFFFFD99F58925826090E1B804606DC9B25D69522D5
          9423D59423D59423D59423D59423D59423D59423D79722B0682CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF1513CD242CF81519E8805066A1621F090E198649
          0AD7911FC48727D79623D59525D59525D59525D59525D59525D59525D79924B3
          6B2D1F2CEB1F2CEB222DEB222CEB212CEB212BEB222CEC2532F42331F61925F7
          3624820D110E884B0BEAD095C4CBDCC07917D79929D79728D79728D79728D797
          28D79728D99B27B7702F6D76EF263DF42A3FF42A3FF42A3EF4293DF4293CF427
          3AF32739F32839F5202FF80B098F905106EAC875DEC391D49425D7992CD79A2C
          D79A2CD79A2CD79A2CD79A2CDA9E2CB974316F78EF2A44F42D46F42D45F42C45
          F42C44F42C42F42C42F42B41F4293EF42F48F65C6FFF4F2B7DE8B84DDFAD4DE0
          B054DDA745D99E32D99B2FD99C30D99C31D99C31DCA031BC7833707BF22A45F4
          2C48F42C47F42C46F42C45F42C46F32F48F42C45F43852F595A7FF1B1ACF9658
          19E7BB5AE0B256E0B256E0B357E1B45ADEAC4BD9A036D99F36DAA037DCA437C1
          7D357480F484A0FA849EF9849EF9839CF9849CF98BA0FA2E4BF43D5BF691A7FF
          2620D60B0D119A5E1DE8BC65E2B45DE2B45DE2B45DE2B45DE2B65EE3B45EDFAB
          4BDDA33BDFA73EC480363A3AED4D50EF4B4EEF4A4EEF4A4EEF4B50EF363BEF44
          67F794ACFE6245B7A56B2C070C149E6524E9C16CE4B965E4B965E4B965E4B965
          E4B965E4B965E4BA67E4B660DFAA46C88439FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF292BEF8DA1F92527FAEAB862AB7132060B16A46A27ECC475E6BC6DE6
          BC6DE6BC6DE6BC6DE6BC6DE6BC6DE6BC6DE6BC6FE8C071CA8937FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF2B27F11B17F1FFFFFFE5B15EAB7536060A16AA6F
          2BEDC97BE8C274E8C274E8C274E8C274E8C274E8C274E8C274E8C274EAC679CD
          8C3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1812F1FFFFFFFFFFFFE0AE67
          AF7838050A15AF752EEFCD84EAC67DEAC67DEAC67DEAC67DEAC67DEAC67DEAC6
          7DEAC67DEDCA83D0903CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE1B06BB17B3A040A15B27A32F1D18FEDCA86EDCA86EDCA86EDCA86
          EDCA86EDCA86EDCA86EDCA86EFCE8DD3943DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE3B46CB37E3B040914B88037F4D797EFD08FEF
          D08FEFD08FEFD08FEFD08FEFD08FEFD08FEFD08FF1D496D6993FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6B86EB8823E040A14C690
          3FFFE4A9F8DE9FF6DA9CF3D79AF2D799F2D799F2D799F2D799F2D799F4DBA0D8
          9C41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7BB71
          B7833F04091426211C847458907B5DC8B182F4DCA6FEE8B0FAE4ADF9E2ABF7DF
          A9F6DFA7F7E2AFDBA045FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE9BD73D09B4870512E75552F6D4F2C6B4D2B6749296245275C4024
          B28B4FBF9655EDCA7BF0D38FF4D99BDFA748FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEAC175E6B352EAB755EBB855EBB855EBB855EB
          B855EBB855EAB755E8B351E6B150E3AD4EE3AC4DE3AC4DE4B050}
        OnClick = SpeedButton7Click
        ExplicitLeft = 653
      end
      object SpeedButton8: TSpeedButton
        Left = 351
        Top = 19
        Width = 30
        Height = 23
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C538D254D87876664F2
          EEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF254F8C0170
          D2045FB521518C714744FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          245C9E057AD8009DF200A6F50079CE1E508AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE3EBF4094C991D92E71CA8F205ACF300A9F30480DB2E66A6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE3ECF50754A23AA3EB47B6F53EB9F521ADF30784DA4D81B7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE3EDF6055BAD5EB9F074C8F76AC6F647B9F6177C
          CD5E91C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3EDF70560B77AC9F299D9FA93D6F9
          6FC7F72084D05D98CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFDBD2D2DDD4D4E8E2E2FFFFFFFFFFFFFFFFFF0060C492D7F5B2
          E5FCACE0FB93D6FA2990D95C9BD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC5B5B56842445D3032876058875E586F4440592D319A7F81C6AF
          B0708DB10075CFA2DEF8B1E5FD339DDE5AA1DAFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFECE7E7684141845D5AE3D9CAFFFFEFFFFEE6FFFBDFFFF7D8
          F5E5C3AE8673653739A57E7C81A5C40081DB35A4E257A6E1FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF9F8F8532829D2C2BAFFFFFFFFFCF1FCF6E7F9
          F3DFF8EFD7F5EDCFF5E7C9F8E9CAECCEAD7A4C49966B6B638AB27DC0EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E4547C7B3AFFFFFFFFFFE
          FAFDFAF3FBF7E9FAF4E2F9F1D9F7EED2F2E0C1ECD8B9F0DEC0E9C7A27B5152DD
          CDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEC0C18D6666
          FFFFFFFFFFFEFFFFFBFEFBF4FBF8EAFAF5E2F9F1D9F7EED2F2E1C3E9D2B0EAD4
          B3EDD6B5CEA0827F5961FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF825D60DCCFC5FFFFF6FEFCF6FEFBF6FDFAEFFBF7E8FAF4E1F8F1D8F4EDCF
          F1DFBFE8CEAFE4C1A0EAD1B0E9C7A1906463DCD1D2FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF653A3DFFFFF4FCF9EBFCF9EDFCF8EEFBF7E9FAF5E3F9
          F1DAFCF6E5FAF3DFF6EFD8F6ECCEE8CEAFE7C9A8E9C8A6B2836FC4B2B5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A4045FFFFECFAF5E3FBF5E5FAF5
          E5FAF4E2F8F2DBFDFAF1F8EFDAF2E1C1EBD2AEE3C3A1EEDBBDE9CFAFE6C4A0BD
          947FB7A0A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F464CFFFFE4
          F9F2DAF9F2DCF9F2DBF9F1D9F9F3DEFAF3DDF3E4C4F4E7D2FBF6E9FBF5DEEDDA
          BBE8CEAEE5C29EB78B7AB9A5A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF754D54F9F2D4F9EFD5F9EED4F9EFD5F7EDD0F9F3DBF4E6CDF2E2C6FFFFFF
          FEFCF2F9F4DDF4E7CAE6CCAAE5BF9BB68473CCBCBFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAB9196D2B8A2F9F2D3F3E5C7F3E6C7F2E2C5F6E8CEF0
          E0C1F1E2C9FCF9ECFAF6E5F9F0D7F2E0C2E5C8A5E0B48DA5807DF3F0F0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8CCCD987674F6E5C3F2E2C3ECD4
          B5E9D2B2EBD5B4F5E9CCEDD8B8F8F0D6F8EFD2F4E4C7EAD2B2E3BE9DC99171AA
          9093FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2868C
          BF9B8AF3DEBAEFDCBEE8CCAAE1BC9AE8CEAFEEDABDEDD9BAEED8B8E8CFAEE4C1
          9ED9A179A88B8FEFEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA0818ABF9A89EBCBA6ECD5B4EAD1B1E8CBACE6C9A9E6C6A4
          E4C19FE2B693D19D7CB0908CE4DBDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE959BAA8784CA9F89DEB28AE3
          B992E2B591DDAE87D19F7FBD9080AF9B9FE5DDDEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EB
          ECC5B3B7A99196AC9298B69592AF999EBCA8ACDDD3D4FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = Button5Click
      end
      object SpeedButton9: TSpeedButton
        Left = 611
        Top = 11
        Width = 36
        Height = 36
        Anchors = [akTop]
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB7452E2CFC3FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE7958963F00E6D5C9FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB47C58BB5E00
          B45600E8D6CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7
          5C30CC7002DA8206B65802EAD9CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFAF8A3501ECE7709D67F0AD77F0CB75A05D5AF9AFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC6997DA64B0CA14400A34300A34400A34600A34501A34602
          B85B05B85C06B95D07B85D08CF770CD8860FD78410D88711CB740FBE610AA64A
          06BC7E57FFFFFFFFFFFFFFFFFFAF5B1DCA6F06DA8208D8810BD9820AD9830DD9
          830CDA870FDC8C11CB7009AF4D00AF4B00D6800FDA8815DB8715DA8A16DA8A19
          DC8D1BDD8E1CE0941DD88318AC4E08F6EDE7C08864D47E0CD8840ED6850FD785
          10D78511D88511D88514D98615CD720ECD720EFEF2DCFEF2DCCD720ED78217DD
          8E1DDC8E1FDD8F1FDD8F1FDE9020DE9520E29522E29623B35F21AC4E07DC8A14
          D88414DA8615DA8616DA8A17DB8B18DB8B1BDE921CB85600F8E1B1FFFFFFFFFF
          FFF8E1B1BF6106E29622E09422E09424E19825E19626E19726E29926E59C29C4
          6C14AD5209DF8F1DDC8F1BDC8E1BDC8E1FDD8F1EDD8F1FDE901FE09821BF5E02
          F6EDE2FFFFFFFFFFFFF6EDE2BF6009E49D27E29827E39A29E3982AE39E2BE29C
          2CE39D2DE5A030C97418B05209E19420DE8F20E09321E09422E09424E19825E1
          9626E39A27C36606F6EDE2FFFFFFFFFFFFF6EDE2C2680CE5A12FE39D2EE49E2E
          E4A030E4A031E6A132E6A131E8A734CC7819C5721EE5A433E09321E29724E297
          26E29A29E3982AE39E2BE49E2ECA700BF6EDE2FFFFFFFFFFFFF6EDE2C97210E8
          A434E6A533E7A234E7A735E7A436E8A535E7A432ECB34CD2882BCF8931EFCB82
          EDC06DE7AB43E39D2CE29B29E39E2DE39F2FE8A332CF790FF6EDE2FFFFFFFFFF
          FFF6EDE2D07B15EAA839E8A637E9A536E8A536E9AB3CEDB656EEC87DF3D394D6
          943ED18932F0CC83EEC880EFC982EFCC86EEC474ECBB5DE9AF47EAAF48D27D0D
          F6EDE2FFFFFFFFFFFFF6EDE2D38011EBB149EDB654EDC069F1C97FF3D190F3D0
          8EF4CF8FF5D393D9993ED38E35F0CE86F0C984F0CB86F0CB86F2CC89F2CC8AF2
          CD8DF2CF8FEDB654F6EDE2FFFFFFFFFFFFF6EDE2EDB654F5D294F4D191F4D091
          F3D08FF2D091F2D090F3CE90F5D697DA9C43D6933CF3CF8FF1CB88F1CC88F1CC
          89F1CC89F2CD8AF2CD89F3CF8BEDB654F8E1B1FDFFFFFBF3ECF8E1B1EDB654F2
          D091F3D291F3D291F5D392F5D392F5D393F5D493F7D899DEA145D8983DF4D190
          F2CE89F3CE8DF3CF8DF3CF8DF3CF8EF2D091F2D091EDB654D69E53D69E53CC90
          49CC9049EBC075F5D493F5D493F5D496F5D496F6D596F6D597F6D597F8DA9FE1
          A648DA9A41F5D494F2D090F1D090F3D291F3D291F3D392F5D392F5D393F3CC86
          F8E1B1FEF2DCFEF2DCF8E1B1F1C97FF7D598F6D697F6D698F6D698F6D89AF6D8
          9AF6D99BF8DEA3D9912DDD9E42F7D797F5D393F5D493F5D493F5D496F5D496F6
          D596F7D698F1C97FFEF2DCFFFFFFFFFFFFFEF2DCE3B974F8DA9EF6D99BF7D99B
          F7D99DF7DA9DF7DA9DF7DAA0F9DFA8D9993AE3B068F8D899F6D597F6D597F6D6
          97F6D698F6D698F6D89AF7D99CECC273FEF2DCFFFFFFFFFFFFFFFFFFCB924BFA
          DEA5F7DAA1F7DAA0F8DBA0F8DBA1F8DBA1F8DCA0FBE4B1DE9C3BE3B165F8E1B1
          F6D797F6D89BF6D99BF6D99BF7D99DF7DA9DF8DB9FF0C77EFEF2DCFFFFFFFFFF
          FFFFFFFFDBAA63FAE0A5F8DCA1F8DCA2F8DCA2F9DDA2F9DDA1F9DC9EFEEFD3E3
          A951DB9337FFFDF4F6DEA7F6D89BF6D89CF6D89CF8DA9CF8DA9CF8DA9EF0C77E
          E2AF59E2AF59E2AF59C98C43DBAA63F9DC9FF9DC9FF9DC9FF9DE9FF9DE9FF9DD
          A0FCE9BFF7E5C4EBBD80F5DFC5E4B056FFFEF7FEF2DCFEF2DBFEF2DBFEF2DBFE
          F1DCFEF1DCFEF1DEFDF0DBF6E5CCF2E3C8FDF0DCFEF4DEFDF3DCFDF3DCFDF3DC
          FDF2DCFDF3DCFEF4E3FEF8EEE6A236FFFFFFFFFFFFF5E0C5E29D3AEABB69EBC1
          77EBC076EBC076EBC376ECC376ECC477ECC477ECC578ECC578EDC477EDC578ED
          C577EDC578EFC578EFC678EFC77AECBC5EEAB056FFFDF9FFFFFF}
        OnClick = SpeedButton9Click
      end
      object ComboBox2: TComboBox
        Left = 8
        Top = 21
        Width = 49
        Height = 21
        TabOrder = 0
        TextHint = 'Juz'
        OnChange = ComboBox2Change
      end
      object ComboBox3: TComboBox
        Left = 63
        Top = 21
        Width = 66
        Height = 21
        TabOrder = 1
        TextHint = 'Halaman'
        OnChange = ComboBox3Change
      end
      object ComboBox1: TComboBox
        Left = 135
        Top = 21
        Width = 90
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = #1575#1604#1601#1575#1578#1581#1577
        TextHint = 'Surat'
        OnChange = ComboBox1Change
        Items.Strings = (
          #1575#1604#1601#1575#1578#1581#1577
          #1575#1604#1576#1602#1585#1577
          #1570#1604#1593#1605#1585#1575#1606
          #1575#1604#1606#1587#1575#1569
          #1575#1604#1605#1575#1574#1583#1577
          #1575#65271#1606#1593#1575#1605
          #1575#65271#1593#1585#1575#1601
          #1575#65271#1606#1601#1575#1604
          #1575#1604#1578#1608#1576#1577
          #1610#1608#1606#1587
          #1607#1608#1583
          #1610#1608#1587#1601
          #1575#1604#1585#1593#1583
          #1573#1576#1585#1575#1607#1610#1605
          #1575#1604#1581#1580#1585
          #1575#1604#1606#1581#1604
          #1575#65273#1587#1585#1575#1569
          #1575#1604#1603#1607#1601
          #1605#1585#1610#1605
          #1591#1607
          #1575#65271#1606#1576#1610#1575#1569
          #1575#1604#1581#1580
          #1575#1604#1605#1572#1605#1606#1608#1606
          #1575#1604#1606#1608#1585
          #1575#1604#1601#1585#1602#1575#1606
          #1575#1604#1588#1593#1585#1575#1569
          #1575#1604#1606#1605#1604
          #1575#1604#1602#1589#1589
          #1575#1604#1593#1606#1603#1576#1608#1578
          #1575#1604#1585#1608#1605
          #1604#1602#1605#1575#1606
          #1575#1604#1587#1580#1583#1577
          #1575#65271#1581#1586#1575#1576
          #1587#1576#1571
          #1601#1575#1591#1585
          #1610#1587
          #1575#1604#1589#1575#1601#1575#1578
          #1589
          #1575#1604#1586#1605#1585
          #1594#1575#1601#1585
          #1601#1589#1604#1578
          #1575#1604#1588#1608#1585#1609
          #1575#1604#1586#1582#1585#1601
          #1575#1604#1583#1582#1575#1606
          #1575#1604#1580#1575#1579#1610#1577
          #1575#65271#1581#1602#1575#1601
          #1605#1581#1605#1583
          #1575#1604#1601#1578#1581
          #1575#1604#1581#1580#1585#1575#1578
          #1602
          #1575#1604#1584#1575#1585#1610#1575#1578
          #1575#1604#1591#1608#1585
          #1575#1604#1606#1580#1605
          #1575#1604#1602#1605#1585
          #1575#1604#1585#1581#1605#1606
          #1575#1604#1608#1575#1602#1593#1577
          #1575#1604#1581#1583#1610#1583
          #1575#1604#1605#1580#1575#1583#1604#1577
          #1575#1604#1581#1588#1585
          #1575#1604#1605#1605#1578#1581#1606#1577
          #1575#1604#1589#1601
          #1575#1604#1580#1605#1593#1577
          #1575#1604#1605#1606#1575#1601#1602#1608#1606
          #1575#1604#1578#1594#1575#1576#1606
          #1575#1604#1591#1604#1575#1602
          #1575#1604#1578#1581#1585#1610#1605
          #1575#1604#1605#1604#1603
          #1575#1604#1602#1604#1605
          #1575#1604#1581#1575#1602#1577
          #1575#1604#1605#1593#1575#1585#1580
          #1606#1608#1581
          #1575#1604#1580#1606
          #1575#1604#1605#1586#1605#1604
          #1575#1604#1605#1583#1579#1585
          #1575#1604#1602#1610#1575#1605#1577
          #1575#65273#1606#1587#1575#1606
          #1575#1604#1605#1585#1587#1604#1575#1578
          #1575#1604#1606#1576#1571
          #1575#1604#1606#1575#1586#1593#1575#1578
          #1593#1576#1587
          #1575#1604#1578#1603#1608#1610#1585
          #1575#1604#1575#1606#1601#1591#1575#1585
          #1575#1604#1605#1591#1601#1601#1610#1606
          #1575#1604#1575#1606#1588#1602#1575#1602
          #1575#1604#1576#1585#1608#1580
          #1575#1604#1591#1575#1585#1602
          #1575#65271#1593#1604#1609
          #1575#1604#1594#1575#1588#1610#1577
          #1575#1604#1601#1580#1585
          #1575#1604#1576#1604#1583
          #1575#1604#1588#1605#1587
          #1575#1604#1604#1610#1604
          #1575#1604#1590#1581#1609
          #1575#1604#1588#1585#1581
          #1575#1604#1578#1610#1606
          #1575#1604#1593#1604#1602
          #1575#1604#1602#1583#1585
          #1575#1604#1576#1610#1606#1577
          #1575#1604#1586#1604#1586#1604#1577
          #1575#1604#1593#1575#1583#1610#1575#1578
          #1575#1604#1602#1575#1585#1593#1577
          #1575#1604#1578#1603#1575#1579#1585
          #1575#1604#1593#1589#1585
          #1575#1604#1607#1605#1586#1577
          #1575#1604#1601#1610#1604
          #1602#1585#1610#1588
          #1575#1604#1605#1575#1593#1608#1606
          #1575#1604#1603#1608#1579#1585
          #1575#1604#1603#1575#1601#1585#1608#1606
          #1575#1604#1606#1589#1585
          #1575#1604#1605#1587#1583
          #1575#65273#1582#1604#1575#1589
          #1575#1604#1601#1604#1602
          #1575#1604#1606#1575#1587)
      end
      object Edit1: TEdit
        Left = 229
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 3
        TextHint = 'Mencari Text Ayat '
        OnKeyPress = Edit1KeyPress
      end
      object CheckListBox1: TCheckListBox
        Left = 739
        Top = 13
        Width = 163
        Height = 36
        OnClickCheck = CheckListBox1ClickCheck
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
end
