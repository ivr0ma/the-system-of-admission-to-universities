object UniServerModule: TUniServerModule
  OldCreateOrder = False
  AutoCoInitialize = True
  FilesFolder = 'files\'
  TempFolder = 'temp\'
  ExtRoot = 'ext-x.y.z\'
  ServerRoot = 'D:\UNIGUI\'
  SessionTimeout = 600000
  Port = 8073
  Title = 'New Application'
  BGColor = 8404992
  CharSet = 'utf-8'
  FaviconOptions = [foVisible, foLocalCache]
  AjaxTimeout = 30000
  DefaultImageFormat = cfJpeg
  UseGlobalImageCache = True
  SuppressErrors = []
  UnavailableErrMsg = 'Server unavailable, please try later'
  LoadingMessage = 'Loading...'
  Bindings = <>
  ExtJSVersion = '4.1.1a'
  MainFormDisplayMode = mfPage
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">An Exception has occu' +
      'red in application:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionMessage = 'Invalid session or session Timeout.'
  ServerMessages.TerminateMessage = 'Web session terminated.'
  ExtLocale = '[Auto]'
  Compression.MinTextSize = 512
  Height = 150
  Width = 215
end
