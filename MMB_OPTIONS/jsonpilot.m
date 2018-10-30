
delete('Modelbasefile.json');
fid = fopen('Modelbasefile.json','a');
fprintf(fid, '{ \n');
fclose(fid);
%% Section on IRFs
if max(strcmp('IRF',fields(result))) == 1
try
irfresp = eval(['fields(json.IRF.' deblank(irfmod) '.' irfshock ')'] );
for resp = 1:size(irfresp,1)
fid = fopen('Modelbasefile.json','a');
fprintf(fid, '{ \n');
fprintf(fid,['"model":"', deblank(irfmod),'",\n' ]);
fprintf(fid,['"rule":"', deblank(modelbase.rulenamesshort1(modelbase.rule,:)), '",\n']);

if irfshock == 'Mon'
% fprintf(fid,['"shock":"', irfshock,'",\n' ]);
fprintf(fid,['"shock":"monetary_policy",\n' ]);
else
fprintf(fid,['"shock":"fiscal_policy",\n' ]);
end

fprintf(fid,['"type":"IRF", \n',]);
fprintf(fid,['"subtype":"', char(irfresp(resp)), '",\n']);
eval(['IRFval = json.IRF.', irfmod,'.', irfshock,'.' , char(irfresp(resp)) ,';'])
fprintf(fid,['"values": [', regexprep(num2str(IRFval),'\s+',',\n') ,' ] \n' ]);
fprintf(fid, '}, \n');
fclose(fid);
end
catch
end
end
%% Section on ACF
if max(strcmp('AC',fields(result))) == 1
autresp = eval(['fields(json.AUTR.' deblank(autmod) ')'] );
for resp = 1:size(autresp,1)
fid = fopen('Modelbasefile.json','a');
if resp == 1
fprintf(fid, '{ \n');
end
fprintf(fid, '{ \n');
fprintf(fid,['"model":"', deblank(autmod) ,'",\n' ]);
fprintf(fid,['"rule":"', deblank(modelbase.rulenamesshort1(modelbase.rule,:)), '",\n']);
if autshock == 'Mon'
% fprintf(fid,['"shock":"', autshock,'",\n' ]);
fprintf(fid,['"shock":"monetary_policy",\n' ]);
else
fprintf(fid,['"shock":"fiscal_policy",\n' ]);
end

fprintf(fid,['"type":"AC", \n',]);
fprintf(fid,['"subtype":"', char(autresp(resp)), '",\n']);
eval(['AUTval = json.AUTR.', autmod,'.',  char(autresp(resp)) ,';'])
fprintf(fid,['"values": [', regexprep(num2str(AUTval),'\s+',',\n') ,' ] \n']);
fprintf(fid, '}, \n');
fclose(fid);
end
end
%% Section on unconditional VAR
% if max(strcmp('VAR',fields(json))) == 1
% vresp = eval(['fields(json.VAR.' deblank(vmod) ')'] );
% for resp = 1:size(vresp,1)
% fid = fopen('Modelbasefile.json','a');
% fprintf(fid, '{ \n');
% fprintf(fid,['"model":"', deblank(vmod),'",\n' ]);
% % fprintf(fid,['"rule":"', deblank(modelbase.rulenamesshort1(modelbase.rule,:)), '",\n']);
% fprintf(fid,['"shock":"', autshock,'",\n' ]);
% fprintf(fid,['"type":"VAR", \n',]);
% fprintf(fid,['"subtype":"', char(vresp(resp)), '",\n']);
% eval(['Vval = json.VAR.', vmod,'.',  char(vresp(resp)) ,';'])
% fprintf(fid,['"values": [', regexprep(num2str(Vval),'\s+',','),' ] \n']);
% fprintf(fid, '}, \n');
% fclose(fid);
% end
% end



fid = fopen('Modelbasefile.json','a');
fprintf(fid, '} \n');
fclose(fid);
