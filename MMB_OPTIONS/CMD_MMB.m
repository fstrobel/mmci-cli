function function_output = CMD_MMB(models,rules,output,shock,varargin)

modelsvec = de2bi(models,114);       % 1*114 vector for selecting models to run
rule = de2bi(rules,11);             % 1*11 vector for selecting rules to run
outp = de2bi(output,3);             % ACF for first digit, IRF for second, Unc. variance for third
option1 = outp(1,1);                % option1 :(1 - double) Autocorrelation Functions (ACFs) will be plotted, default = 1
option2 = outp(1,2);                % option2 :(1 - double) Impulse Response Functions (IRFs) will be plotted, default = 1
option5 = outp(1,3);                % option5 :(1 - double) Show the unconditional variance in the Matlab console, default =1
shocks = de2bi(shock,2);            % 1*2  vector for selecting Monetary policy shock (default, shocks(1,1)=1) and/or Fiscal polilcy shock (shocks(1,2) = 1)
if exist('Modelbase') ~= 0
    delete Modelbase
end

%%%%%%%%%%%%%%%%%%% Declaration of key settings
warning('off','all')
%% Adding dynare to path if it was not
addpath c:\dynare\4.5.6\matlab
%% Adding MMB to path (required for Dynare and Octave)
cd(fileparts(mfilename('fullpath')));
cd ..
currentpath= cd;  cd(currentpath);
addpath(currentpath);
OSenvironment = isunix;

addpath([currentpath filesep 'ALTOOL' filesep]);
addpath([currentpath filesep 'MODELS' filesep]);
newpath=[currentpath filesep 'MMB_OPTIONS' filesep];
cd([currentpath filesep 'MMB_OPTIONS' filesep])

%% Loading in the MMB Settings
if nargin>0
    for ii=1:2:size(varargin,2)
        if isrow(varargin{ii+1})
            eval([varargin{ii},'= [ ',strtrim(varargin{ii+1}),'];']) 
        else
        eval([varargin{ii},'=',strtrim(varargin{ii+1}),';'])
        end
    end
end

MMB_settings

disp(' ')
disp('Selected Models:')
for epsilon=1:size(modelbase.models,2)
    disp([strtrim(deblank(modelbase.names((modelbase.models(epsilon)),:)))]);
end
disp(' ')
disp('Selected Policy Rule:');
disp(deblank(modelbase.rulenames(modelbase.rule,:)));

modelbase.modelchosen=find(modelsvec>0);
modelbase.rule=rule;
save Modelbase modelbase                                % neccessary to save in between as dynare clears the workspace
MMB_opt2    

end


function MMB_opt2
load Modelbase
keyvariables = [ 'inflation'; 'interest '; 'output   ';'outputgap'];
%% One model many rules
rulechosen=find(modelbase.rule>0);
modelbase.info = ones(size(modelbase.rule,2),1);
modelbase.rulerank=0;
disp(' ');
disp('Selected options:');
if modelbase.option(1) == 1
    disp('Autocorrelation functions will be plotted.');
else disp('Autocorrelation functions will not be plotted.');
end

if modelbase.option(2) == 1
    disp('Impulse response functions will be plotted.');
else disp('Impulse response functions will not be plotted.');
end

modelbase.namesshocks= char(['Mon. Pol. Shock      '
    'Fiscal Pol. Shock    ']);
modelbase.namesinnos= char(['interest_'
    'fiscal_  ']);

modelbase.innos = [];
choices=find(modelbase.shocks>0);
if modelbase.option(2)==1
    modelbase.innos=modelbase.namesinnos(choices,:);
    modelbase.namesshocks = modelbase.namesshocks(choices,:);
    % this is neccesary for plotting the right shock in the right figure otherwise the order might get confused; if all model specific shocks are chosen, we put [] here. The names are assigned in stoch_simul_modelbase
    
end;

%%
%%%%%%%%   Loop for Solving a model together with each chosen rule and producing results %%%%%%

for epsilon=1:size(modelbase.models,2)
for i=1:size(modelbase.rulenames,1)
rulenamesshort1= deblank(modelbase.rulenamesshort1(logical(modelbase.rule),:));
    if (modelbase.rule(i)>0) % If the i-th rule has been chosen
        modelbase.l=i; %Save the legend for the i-th rule
        %% The code block for rule choices
        if (i>2)
            cofintintb1 = modelbase.common_rule(i,1); cofintintb2 = modelbase.common_rule(i,2); cofintintb3 = modelbase.common_rule(i,3);
            cofintintb4 = modelbase.common_rule(i,4); cofintinf0 = modelbase.common_rule(i,5); cofintinfb1 = modelbase.common_rule(i,6); cofintinfb2 = modelbase.common_rule(i,7);
            cofintinfb3 = modelbase.common_rule(i,8); cofintinfb4 = modelbase.common_rule(i,9); cofintinff1 = modelbase.common_rule(i,10); cofintinff2 = modelbase.common_rule(i,11);
            cofintinff3 = modelbase.common_rule(i,12); cofintinff4 = modelbase.common_rule(i,13); cofintout = modelbase.common_rule(i,14); cofintoutb1 = modelbase.common_rule(i,15);
            cofintoutb2 = modelbase.common_rule(i,16); cofintoutb3 = modelbase.common_rule(i,17); cofintoutb4 = modelbase.common_rule(i,18); cofintoutf1 = modelbase.common_rule(i,19);
            cofintoutf2 = modelbase.common_rule(i,20); cofintoutf3 = modelbase.common_rule(i,21); cofintoutf4 = modelbase.common_rule(i,22);
            cofintoutp = modelbase.common_rule(i,23); cofintoutpb1 = modelbase.common_rule(i,24); cofintoutpb2 = modelbase.common_rule(i,25); cofintoutpb3 = modelbase.common_rule(i,26);
            cofintoutpb4 = modelbase.common_rule(i,27); cofintoutpf1 = modelbase.common_rule(i,28); cofintoutpf2 = modelbase.common_rule(i,29); cofintoutpf3 = modelbase.common_rule(i,30);
            cofintoutpf4 = modelbase.common_rule(i,31);
            std_r_ = modelbase.common_rule(i,32);
            std_r_quart = modelbase.common_rule(i,33);
            disp(' ')
            disp('Selected Policy Rule:');
            disp(deblank(modelbase.rulenames(i,:)));
        elseif i==1
            % User-specified policy rule
            cofintintb1 =  modelbase.data(2,1); cofintintb2 = modelbase.data(3,1); cofintintb3 = modelbase.data(4,1); cofintintb4 = modelbase.data(5,1);
            cofintinf0 = modelbase.data(1,2); cofintinfb1 = modelbase.data(2,2); cofintinfb2 = modelbase.data(3,2); cofintinfb3 = modelbase.data(4,2); cofintinfb4 = modelbase.data(5,2);
            cofintinff1 = modelbase.data(6,2); cofintinff2 = modelbase.data(7,2); cofintinff3 = modelbase.data(8,2); cofintinff4 = modelbase.data(9,2);
            cofintout = modelbase.data(1,3); cofintoutb1 = modelbase.data(2,3); cofintoutb2 = modelbase.data(3,3); cofintoutb3 = modelbase.data(4,3); cofintoutb4 = modelbase.data(5,3);
            cofintoutf1 = modelbase.data(6,3); cofintoutf2 = modelbase.data(7,3); cofintoutf3 = modelbase.data(8,3); cofintoutf4 = modelbase.data(9,3);
            cofintoutp = modelbase.data(1,4); cofintoutpb1 = modelbase.data(2,4); cofintoutpb2 = modelbase.data(3,4); cofintoutpb3 = modelbase.data(4,4); cofintoutpb4 = modelbase.data(5,4);
            cofintoutpf1 = modelbase.data(6,4); cofintoutpf2 = modelbase.data(7,4); cofintoutpf3 = modelbase.data(8,4); cofintoutpf4 = modelbase.data(9,4);
            std_r_ = 1;
            std_r_quart = 0.25;
            disp(' ')
            disp('Selected Policy Rule:');
            disp(deblank(modelbase.rulenames(i,:)));
        elseif  i==2
            % Original Model-Specific Policy Rule
            for r = 1: size(modelbase.modelchosen,1)
                coeff_vec=MSR_COEFFS(modelbase.modelchosen(r));
                        if prod(isnan(coeff_vec ))
                            disp('**********************************************************');
                            disp('The selected model does not feature a model specific rule.');
                            disp('**********************************************************');
                        end
                cofintintb1 =  coeff_vec(1); cofintintb2 = coeff_vec(2); cofintintb3 = coeff_vec(3); cofintintb4 = coeff_vec(4);
                cofintinf0 = coeff_vec(5); cofintinfb1 = coeff_vec(6); cofintinfb2 = coeff_vec(7); cofintinfb3 = coeff_vec(8); cofintinfb4 = coeff_vec(9);
                cofintinff1 = coeff_vec(10); cofintinff2 = coeff_vec(11); cofintinff3 = coeff_vec(12); cofintinff4 = coeff_vec(13);
                cofintout = coeff_vec(14); cofintoutb1 = coeff_vec(15); cofintoutb2 = coeff_vec(16); cofintoutb3 = coeff_vec(17); cofintoutb4 = coeff_vec(18);
                cofintoutf1 = coeff_vec(19); cofintoutf2 =  coeff_vec(20); cofintoutf3 = coeff_vec(21); cofintoutf4 = coeff_vec(22);
                cofintoutp = coeff_vec(23); cofintoutpb1 = coeff_vec(24); cofintoutpb2 = coeff_vec(25); cofintoutpb3 = coeff_vec(26); cofintoutpb4 = coeff_vec(27);
                cofintoutpf1 = coeff_vec(28); cofintoutpf2 =  coeff_vec(29); cofintoutpf3 = coeff_vec(30); cofintoutpf4 = coeff_vec(31);
                std_r_ = coeff_vec(32);
                std_r_quart = coeff_vec(33);
                disp(' ')
                disp('Selected Policy Rule:');
                disp('Model Specific Policy Rule');
            end
        end
        %%
        
        cd('..');
        cd MODELS
        save policy_param.mat cofintintb1 cofintintb2 cofintintb3 cofintintb4...
            cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4 cofintinff1 cofintinff2 cofintinff3 cofintinff4...
            cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4 cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4...
            cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4 cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4...
            std_r_ std_r_quart ;
        cd('..');
        cd MMB_OPTIONS

        %**********************************************************************************************************************
        %                    Solving the Model, Computing Statistics                                                          %
        %**********************************************************************************************************************
        save Modelbase modelbase                                % neccessary to save in between as dynare clears the workspace

        modelbase.modeltime(modelbase.models(epsilon)) = cputime;
        modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath filesep 'MODELS' filesep strtrim(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
        modelbase.epsilon = epsilon;
        al=deblank(modelbase.names(modelbase.models(epsilon),:));
        modelbase.AL=strcmp(al(end-1:end),'AL');
        
        if modelbase.AL
            if modelbase.l==min(find(modelbase.rule>0)) % If the model is solved for the first rule chosen
                modelbase.ModelGAIN(modelbase.models(epsilon))=modelbase.gain;
            end
        end
        
        save -append Modelbase modelbase
        cd(modelbase.setpath(modelbase.models(epsilon),:));                                 % go to directory of specific model
        disp(' ');
        disp(['Currently Solving: ', strtrim(deblank(strtrim(modelbase.names(modelbase.models(epsilon),:))))]); 
        eval(['dynare '  modelbase.names(modelbase.models(epsilon),:)]);% solve model "epsilon" in dynare by running the .mod file --> translates Dynare syntax into .m file, that is run
        cd('..');
        cd('..'); % insert one more cd('..');
        cd MMB_OPTIONS
        modelbase=stoch_simul_MMB(modelbase);                                     % solve model
        cd(modelbase.homepath);                                                   % go back to main directory

        modelbase.modeltime(modelbase.models(modelbase.epsilon))=cputime-modelbase.modeltime(modelbase.models(modelbase.epsilon));
        disp(['Elapsed cputime is ' ,num2str(modelbase.modeltime(modelbase.models(modelbase.epsilon))), ' seconds.']);
        modelbase = rmfield(modelbase,'setpath') ; % path for dynare file of specific model

    end
end

%% Creating JSON structure

for i=1:size(modelbase.rulenames,1);
    if (modelbase.rule(i)>0); % If the i-th rule has been chosen
        modelbase.l=i;
            warning off
            if modelbase.option(1)==1
                for pp=1:4;
                        if loc(modelbase.AUTendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:))~=0;
                            autmod = deblank(strtrim(modelbase.names(modelbase.models(epsilon),:)));
%                             if modelbase.rulenamesshort1(modelbase.l,:) == char('Model_Rule  ');
%                                 autrule = autmod;
%                             else
                                 autrule = deblank(modelbase.rulenamesshort1(modelbase.l,:));
%                             end
                            autvar = keyvariables(pp,:);
                            eval(['json.' , autmod, '.', autrule, '.AUTR.', autvar ,'= modelbase.AUTR.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.AUTendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:);']);
                        end;
                end;
            if modelbase.option(5)==1
                  disp(' ')
                  disp([strtrim(deblank(strtrim(modelbase.names(modelbase.models(epsilon),:))))]); 
                  disp([strtrim(modelbase.rulenamesshort1(modelbase.l,:))]);
                  disp(' ')
                  disp('Variables           Variance       ')
                for pp=1:4;
                       if loc(modelbase.VARendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:))~=0;
                            var = modelbase.VAR.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.VARendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),loc(modelbase.VARendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)));
                            vmod = deblank(strtrim(modelbase.names(modelbase.models(epsilon),:)));
 %                            if modelbase.rulenamesshort1(modelbase.l,:) == char('Model_Rule  ');
 %                                vrule = vmod;
 %                            else
                                 vrule = deblank(modelbase.rulenamesshort1(modelbase.l,:));
 %                            end
                            vname = keyvariables(pp,:);
                            eval(['json.' , vmod, '.', vrule, '.VAR.', vname ,' = var;']);
                            st = sprintf('%9s %19f', vname,var);
                            disp(st);
                       end;
                end;
            end
            if modelbase.option(2)==1
               for p=1:size(modelbase.innos,1)
                   for pp=1:4;
                        if  modelbase.pos_shock(p,modelbase.models(epsilon))~=0
           %% Creating JSON structure - Inflation, interest rate, and output gap
                            irfmod = deblank(strtrim(modelbase.names(modelbase.models(epsilon),:)));
%                             if modelbase.rulenamesshort1(modelbase.l,:) == char('Model_Rule  ');
%                                 irfrule = irfmod;
%                             else
                                 irfrule = deblank(modelbase.rulenamesshort1(modelbase.l,:));
%                             end
                            irfshock = ([deblank(modelbase.namesshocks(p,1:3)),'_shock']);
                            irfvar = keyvariables(pp,:);
                            if loc(modelbase.IRFendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:))~=0
                            eval(['json.' , irfmod , '.', irfrule, '.IRF.', irfshock, '.', irfvar ,'= modelbase.IRF.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.IRFendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:,p);']);
                            eval(['json.' , irfmod , '.', irfrule, '.IRF.', irfshock, '.', irfvar, '= modelbase.IRF.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.IRFendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:,p);']);
                            eval(['json.' , irfmod , '.', irfrule, '.IRF.', irfshock, '.', irfvar ,'= modelbase.IRF.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.IRFendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:,p);']);
                            eval(['json.' , irfmod , '.', irfrule, '.IRF.', irfshock, '.', irfvar ,'= modelbase.IRF.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.IRFendo_names.(strtrim(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:,p);']);
                            end;
                        end;
                   end;
               end;
            end;
        end;
    end;
end
try
    eval(['modelbase.result.', strtrim(modelbase.names(modelbase.modelchosen,:)),  '= result;']);
catch
end

% The following lines are necessary so that the dimensions of the respective matrices adjust with each model
modelbase.AUTR = []; modelbase.AUTendo_names = []; modelbase.IRF = []; modelbase.IRFendo_names = []; modelbase.VAR = []; modelbase.VARendo_names = [];
modelbase.pos_shock = [];

end;

save Modelbase modelbase -append
modelbase.totaltime = cputime-modelbase.totaltime;
savejson('',json,'OUTPUTSJSON');

disp(['Total elapsed cputime: ' ,num2str(modelbase.totaltime), ' seconds.']);
rmpath(modelbase.homepath);

end

function [IRF_Non_Aux_Var,IRFendo_names_Non_Aux]=Get_IRF_VAR(current_shock,current_rule,i, rules_set,rules_chosen,rule_solved,rules_setshort1,IRF_STR,Index_Non_Aux_Var,All_Endo_Var,precision)
r1=1;
for r=1:size(rules_set,1)
    if (rules_chosen(r)>0)
        if ~rule_solved(r)
            IRF_Non_Negligeable_Var = IRF_STR.(strtrim(deblank(rules_setshort1(r,:))))(:,:,current_shock);
            for v=1:size(IRF_Non_Negligeable_Var,1)
                IRF_Non_Negligeable(v,r1)=(max(abs(IRF_Non_Negligeable_Var(v,:)))>precision);
            end
            r1=r1+1;
        end
    end
end
Index_Non_Negligeable_Var{current_shock}=max(IRF_Non_Negligeable,[],2);
Index_Non_Negligeable_Var{current_shock}=find(Index_Non_Negligeable_Var{current_shock}>0);
To_be_plotted=intersect(Index_Non_Aux_Var,Index_Non_Negligeable_Var{current_shock});
IRF_Non_Aux_Var=IRF_STR.(strtrim(deblank(rules_setshort1(current_rule,:))))(To_be_plotted,:,:);
IRFendo_names_Non_Aux = All_Endo_Var(To_be_plotted,:);
end

