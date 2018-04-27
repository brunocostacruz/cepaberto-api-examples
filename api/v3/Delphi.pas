//Evento click do botão.
var
    stream : TStringStream;
    JSONResult : TJSONObject;
begin
  IdHTTP1.Request.Clear;
  IdHTTP1.Request.CustomHeaders.Clear;
  IdHTTP1.Request.Accept := 'text/html, */*';
  IdHTTP1.Request.CustomHeaders.Add('Authorization: Token token="*****SUA CHAVE AQUI*****"');
  stream := TStringStream.Create('');
  try
    try
      IdHTTP1.Get('http://www.cepaberto.com/api/v2/ceps.json?cep='+ edtCepaConsultar.Text, stream);

      JSONResult     := TJSONObject.ParseJSONValue(stream.DataString) as TJSONObject;
	  
      edtLogradouro.text    := Utf8ToAnsi(JSONResult.GetValue('logradouro').Value);
      edtBairro.text := Utf8ToAnsi(JSONResult.GetValue('bairro').Value);
      edtCidade.text := Utf8ToAnsi(JSONResult.GetValue('cidade').Value);
      edtEstado.text     := Utf8ToAnsi(JSONResult.GetValue('estado').Value);

    finally
        strm.Free;
    end;
  except
  //TUDO BEM
  end;
end;
