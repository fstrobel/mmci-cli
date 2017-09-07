%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'HK_FPP11';
M_.dynare_version = 'master-2017-05-12-ae50f25';
oo_.dynare_version = 'master-2017-05-12-ae50f25';
options_.dynare_version = 'master-2017-05-12-ae50f25';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('HK_FPP11.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = 'epsa';
M_.exo_names_long = 'epsa';
M_.exo_names = char(M_.exo_names, 'epsy');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsy');
M_.exo_names_long = char(M_.exo_names_long, 'epsy');
M_.exo_names = char(M_.exo_names, 'mu_p');
M_.exo_names_tex = char(M_.exo_names_tex, 'mu\_p');
M_.exo_names_long = char(M_.exo_names_long, 'mu_p');
M_.exo_names = char(M_.exo_names, 'epseta');
M_.exo_names_tex = char(M_.exo_names_tex, 'epseta');
M_.exo_names_long = char(M_.exo_names_long, 'epseta');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'x';
M_.endo_names_tex = 'x';
M_.endo_names_long = 'x';
M_.endo_names = char(M_.endo_names, 'q_dach');
M_.endo_names_tex = char(M_.endo_names_tex, 'q\_dach');
M_.endo_names_long = char(M_.endo_names_long, 'q_dach');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'rr');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr');
M_.endo_names_long = char(M_.endo_names_long, 'rr');
M_.endo_names = char(M_.endo_names, 'pi_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_H');
M_.endo_names_long = char(M_.endo_names_long, 'pi_H');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'y_stern');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_stern');
M_.endo_names_long = char(M_.endo_names_long, 'y_stern');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, 's');
M_.endo_names_long = char(M_.endo_names_long, 's');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'y_n');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_n');
M_.endo_names_long = char(M_.endo_names_long, 'y_n');
M_.endo_names = char(M_.endo_names, 'shock_eta');
M_.endo_names_tex = char(M_.endo_names_tex, 'shock\_eta');
M_.endo_names_long = char(M_.endo_names_long, 'shock_eta');
M_.endo_names = char(M_.endo_names, 'interest');
M_.endo_names_tex = char(M_.endo_names_tex, 'interest');
M_.endo_names_long = char(M_.endo_names_long, 'interest');
M_.endo_names = char(M_.endo_names, 'inflation');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflation');
M_.endo_names_long = char(M_.endo_names_long, 'inflation');
M_.endo_names = char(M_.endo_names, 'inflationq');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationq');
M_.endo_names_long = char(M_.endo_names_long, 'inflationq');
M_.endo_names = char(M_.endo_names, 'outputgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'outputgap');
M_.endo_names_long = char(M_.endo_names_long, 'outputgap');
M_.endo_names = char(M_.endo_names, 'output');
M_.endo_names_tex = char(M_.endo_names_tex, 'output');
M_.endo_names_long = char(M_.endo_names_long, 'output');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_80');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_80');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_80');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_84');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_84');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_84');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_88');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_88');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_88');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_115');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_115');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_115');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_119');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_119');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_119');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_123');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_123');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_123');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_150');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_150');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_150');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_154');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_154');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_154');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_158');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_158');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_158');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_7_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_7\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_7_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_7_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_7\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_7_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_17_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_17\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_17_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_17_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_17\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_17_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_17_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_17\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_17_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_16_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_16\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_16_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_16_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_16\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_16_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_16_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_16\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_16_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_13_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_13\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_13_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_13_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_13\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_13_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_13_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_13\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_13_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_15_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_15\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_15_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_15_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_15\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_15_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_15_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_15\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_15_3');
M_.endo_partitions = struct();
M_.param_names = 'cofintintb1';
M_.param_names_tex = 'cofintintb1';
M_.param_names_long = 'cofintintb1';
M_.param_names = char(M_.param_names, 'cofintintb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb2');
M_.param_names_long = char(M_.param_names_long, 'cofintintb2');
M_.param_names = char(M_.param_names, 'cofintintb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb3');
M_.param_names_long = char(M_.param_names_long, 'cofintintb3');
M_.param_names = char(M_.param_names, 'cofintintb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb4');
M_.param_names_long = char(M_.param_names_long, 'cofintintb4');
M_.param_names = char(M_.param_names, 'cofintinf0');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinf0');
M_.param_names_long = char(M_.param_names_long, 'cofintinf0');
M_.param_names = char(M_.param_names, 'cofintinfb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb1');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb1');
M_.param_names = char(M_.param_names, 'cofintinfb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb2');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb2');
M_.param_names = char(M_.param_names, 'cofintinfb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb3');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb3');
M_.param_names = char(M_.param_names, 'cofintinfb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb4');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb4');
M_.param_names = char(M_.param_names, 'cofintinff1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff1');
M_.param_names_long = char(M_.param_names_long, 'cofintinff1');
M_.param_names = char(M_.param_names, 'cofintinff2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff2');
M_.param_names_long = char(M_.param_names_long, 'cofintinff2');
M_.param_names = char(M_.param_names, 'cofintinff3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff3');
M_.param_names_long = char(M_.param_names_long, 'cofintinff3');
M_.param_names = char(M_.param_names, 'cofintinff4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff4');
M_.param_names_long = char(M_.param_names_long, 'cofintinff4');
M_.param_names = char(M_.param_names, 'cofintout');
M_.param_names_tex = char(M_.param_names_tex, 'cofintout');
M_.param_names_long = char(M_.param_names_long, 'cofintout');
M_.param_names = char(M_.param_names, 'cofintoutb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb1');
M_.param_names = char(M_.param_names, 'cofintoutb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb2');
M_.param_names = char(M_.param_names, 'cofintoutb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb3');
M_.param_names = char(M_.param_names, 'cofintoutb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb4');
M_.param_names = char(M_.param_names, 'cofintoutf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf1');
M_.param_names = char(M_.param_names, 'cofintoutf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf2');
M_.param_names = char(M_.param_names, 'cofintoutf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf3');
M_.param_names = char(M_.param_names, 'cofintoutf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf4');
M_.param_names = char(M_.param_names, 'cofintoutp');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutp');
M_.param_names_long = char(M_.param_names_long, 'cofintoutp');
M_.param_names = char(M_.param_names, 'cofintoutpb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb1');
M_.param_names = char(M_.param_names, 'cofintoutpb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb2');
M_.param_names = char(M_.param_names, 'cofintoutpb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb3');
M_.param_names = char(M_.param_names, 'cofintoutpb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb4');
M_.param_names = char(M_.param_names, 'cofintoutpf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf1');
M_.param_names = char(M_.param_names, 'cofintoutpf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf2');
M_.param_names = char(M_.param_names, 'cofintoutpf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf3');
M_.param_names = char(M_.param_names, 'cofintoutpf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf4');
M_.param_names = char(M_.param_names, 'std_r_');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_');
M_.param_names_long = char(M_.param_names_long, 'std_r_');
M_.param_names = char(M_.param_names, 'std_r_quart');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_quart');
M_.param_names_long = char(M_.param_names_long, 'std_r_quart');
M_.param_names = char(M_.param_names, 'coffispol');
M_.param_names_tex = char(M_.param_names_tex, 'coffispol');
M_.param_names_long = char(M_.param_names_long, 'coffispol');
M_.param_names = char(M_.param_names, 'klein_omega');
M_.param_names_tex = char(M_.param_names_tex, 'klein\_omega');
M_.param_names_long = char(M_.param_names_long, 'klein_omega');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'gross_theta');
M_.param_names_tex = char(M_.param_names_tex, 'gross\_theta');
M_.param_names_long = char(M_.param_names_long, 'gross_theta');
M_.param_names = char(M_.param_names, 'sigma_alpha');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_alpha');
M_.param_names_long = char(M_.param_names_long, 'sigma_alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'gross_gamma_a');
M_.param_names_tex = char(M_.param_names_tex, 'gross\_gamma\_a');
M_.param_names_long = char(M_.param_names_long, 'gross_gamma_a');
M_.param_names = char(M_.param_names, 'gross_gamma_y');
M_.param_names_tex = char(M_.param_names_tex, 'gross\_gamma\_y');
M_.param_names_long = char(M_.param_names_long, 'gross_gamma_y');
M_.param_names = char(M_.param_names, 'gross_gamma_null');
M_.param_names_tex = char(M_.param_names_tex, 'gross\_gamma\_null');
M_.param_names_long = char(M_.param_names_long, 'gross_gamma_null');
M_.param_names = char(M_.param_names, 'gross_epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'gross\_epsilon');
M_.param_names_long = char(M_.param_names_long, 'gross_epsilon');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'betaS');
M_.param_names_tex = char(M_.param_names_tex, 'betaS');
M_.param_names_long = char(M_.param_names_long, 'betaS');
M_.param_names = char(M_.param_names, 'lambda_x');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_x');
M_.param_names_long = char(M_.param_names_long, 'lambda_x');
M_.param_names = char(M_.param_names, 'kappa_alpha');
M_.param_names_tex = char(M_.param_names_tex, 'kappa\_alpha');
M_.param_names_long = char(M_.param_names_long, 'kappa_alpha');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'phi_x');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_x');
M_.param_names_long = char(M_.param_names_long, 'phi_x');
M_.param_names = char(M_.param_names, 'rho_eta');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_eta');
M_.param_names_long = char(M_.param_names_long, 'rho_eta');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_y');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_y');
M_.param_names_long = char(M_.param_names_long, 'rho_y');
M_.param_names = char(M_.param_names, 'rho_q');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_q');
M_.param_names_long = char(M_.param_names_long, 'rho_q');
M_.param_names = char(M_.param_names, 'r_steady');
M_.param_names_tex = char(M_.param_names_tex, 'r\_steady');
M_.param_names_long = char(M_.param_names_long, 'r_steady');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'mu');
M_.param_names_tex = char(M_.param_names_tex, 'mu');
M_.param_names_long = char(M_.param_names_long, 'mu');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'omega_C');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_C');
M_.param_names_long = char(M_.param_names_long, 'omega_C');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'zeta');
M_.param_names_tex = char(M_.param_names_tex, 'zeta');
M_.param_names_long = char(M_.param_names_long, 'zeta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'phi2');
M_.param_names_tex = char(M_.param_names_tex, 'phi2');
M_.param_names_long = char(M_.param_names_long, 'phi2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 41;
M_.param_nbr = 65;
M_.orig_endo_nbr = 18;
M_.aux_vars(1).endo_index = 19;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 20;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 21;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 22;
M_.aux_vars(4).type = 0;
M_.aux_vars(5).endo_index = 23;
M_.aux_vars(5).type = 0;
M_.aux_vars(6).endo_index = 24;
M_.aux_vars(6).type = 0;
M_.aux_vars(7).endo_index = 25;
M_.aux_vars(7).type = 0;
M_.aux_vars(8).endo_index = 26;
M_.aux_vars(8).type = 0;
M_.aux_vars(9).endo_index = 27;
M_.aux_vars(9).type = 0;
M_.aux_vars(10).endo_index = 28;
M_.aux_vars(10).type = 1;
M_.aux_vars(10).orig_index = 8;
M_.aux_vars(10).orig_lead_lag = -1;
M_.aux_vars(11).endo_index = 29;
M_.aux_vars(11).type = 1;
M_.aux_vars(11).orig_index = 8;
M_.aux_vars(11).orig_lead_lag = -2;
M_.aux_vars(12).endo_index = 30;
M_.aux_vars(12).type = 1;
M_.aux_vars(12).orig_index = 18;
M_.aux_vars(12).orig_lead_lag = -1;
M_.aux_vars(13).endo_index = 31;
M_.aux_vars(13).type = 1;
M_.aux_vars(13).orig_index = 18;
M_.aux_vars(13).orig_lead_lag = -2;
M_.aux_vars(14).endo_index = 32;
M_.aux_vars(14).type = 1;
M_.aux_vars(14).orig_index = 18;
M_.aux_vars(14).orig_lead_lag = -3;
M_.aux_vars(15).endo_index = 33;
M_.aux_vars(15).type = 1;
M_.aux_vars(15).orig_index = 17;
M_.aux_vars(15).orig_lead_lag = -1;
M_.aux_vars(16).endo_index = 34;
M_.aux_vars(16).type = 1;
M_.aux_vars(16).orig_index = 17;
M_.aux_vars(16).orig_lead_lag = -2;
M_.aux_vars(17).endo_index = 35;
M_.aux_vars(17).type = 1;
M_.aux_vars(17).orig_index = 17;
M_.aux_vars(17).orig_lead_lag = -3;
M_.aux_vars(18).endo_index = 36;
M_.aux_vars(18).type = 1;
M_.aux_vars(18).orig_index = 14;
M_.aux_vars(18).orig_lead_lag = -1;
M_.aux_vars(19).endo_index = 37;
M_.aux_vars(19).type = 1;
M_.aux_vars(19).orig_index = 14;
M_.aux_vars(19).orig_lead_lag = -2;
M_.aux_vars(20).endo_index = 38;
M_.aux_vars(20).type = 1;
M_.aux_vars(20).orig_index = 14;
M_.aux_vars(20).orig_lead_lag = -3;
M_.aux_vars(21).endo_index = 39;
M_.aux_vars(21).type = 1;
M_.aux_vars(21).orig_index = 16;
M_.aux_vars(21).orig_lead_lag = -1;
M_.aux_vars(22).endo_index = 40;
M_.aux_vars(22).type = 1;
M_.aux_vars(22).orig_index = 16;
M_.aux_vars(22).orig_lead_lag = -2;
M_.aux_vars(23).endo_index = 41;
M_.aux_vars(23).type = 1;
M_.aux_vars(23).orig_index = 16;
M_.aux_vars(23).orig_lead_lag = -3;
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('HK_FPP11_static');
erase_compiled_function('HK_FPP11_dynamic');
M_.orig_eq_nbr = 18;
M_.eq_nbr = 41;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 26 67;
 0 27 68;
 0 28 0;
 0 29 0;
 1 30 69;
 2 31 0;
 3 32 0;
 4 33 0;
 5 34 0;
 6 35 0;
 0 36 0;
 0 37 0;
 7 38 0;
 8 39 0;
 0 40 0;
 9 41 70;
 10 42 71;
 11 43 72;
 0 44 73;
 0 45 74;
 0 46 75;
 0 47 76;
 0 48 77;
 0 49 78;
 0 50 79;
 0 51 80;
 0 52 81;
 12 53 0;
 13 54 0;
 14 55 0;
 15 56 0;
 16 57 0;
 17 58 0;
 18 59 0;
 19 60 0;
 20 61 0;
 21 62 0;
 22 63 0;
 23 64 0;
 24 65 0;
 25 66 0;]';
M_.nstatic = 5;
M_.nfwrd   = 11;
M_.npred   = 21;
M_.nboth   = 4;
M_.nsfwrd   = 15;
M_.nspred   = 25;
M_.ndynamic   = 36;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(41, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(65, 1);
M_.NNZDerivatives = [141; 0; -1];
M_.params( 51 ) = 0.775;
rho_eta = M_.params( 51 );
M_.params( 35 ) = 0.33;
klein_omega = M_.params( 35 );
M_.params( 61 ) = 0.33;
phi = M_.params( 61 );
M_.params( 62 ) = 0.1234;
tau = M_.params( 62 );
M_.params( 59 ) = 0.6658;
theta = M_.params( 59 );
M_.params( 36 ) = 0.13;
gamma = M_.params( 36 );
M_.params( 44 ) = 0.015;
gross_epsilon = M_.params( 44 );
M_.params( 45 ) = 0.995;
beta = M_.params( 45 );
M_.params( 52 ) = 0.8549;
rho_a = M_.params( 52 );
M_.params( 54 ) = 0.7750;
rho_q = M_.params( 54 );
M_.params( 53 ) = 0.8306;
rho_y = M_.params( 53 );
M_.params( 37 ) = 0.5047;
alpha = M_.params( 37 );
M_.params( 58 ) = 0.1;
mu = M_.params( 58 );
M_.params( 57 ) = M_.params(58)+log(1-M_.params(37));
nu = M_.params( 57 );
M_.params( 55 ) = 0.01;
r_steady = M_.params( 55 );
M_.params( 64 ) = 0.5;
eta = M_.params( 64 );
M_.params( 63 ) = 0.5;
zeta = M_.params( 63 );
omega = zeta + (1 - alpha) * (eta - 1);
M_.params( 38 ) = omega-1;
gross_theta = M_.params( 38 );
M_.params( 39 ) = 1/(1-M_.params(37)+M_.params(37)*omega);
sigma_alpha = M_.params( 39 );
M_.params( 60 ) = M_.params(58)*(1+M_.params(55))*(1+M_.params(44))/((M_.params(55)+(1+M_.params(55))*M_.params(44))*(1+M_.params(58))*(1-M_.params(35)));
omega_C = M_.params( 60 );
M_.params( 40 ) = M_.params(36)*(1-M_.params(45)*(1-M_.params(36)))/(1-M_.params(36))*M_.params(60);
psi = M_.params( 40 );
M_.params( 46 ) = M_.params(45)/(1+M_.params(40));
betaS = M_.params( 46 );
M_.params( 41 ) = (1+M_.params(61))/(M_.params(61)+M_.params(39));
gross_gamma_a = M_.params( 41 );
M_.params( 42 ) = M_.params(39)*M_.params(38)/(M_.params(61)+M_.params(39));
gross_gamma_y = M_.params( 42 );
M_.params( 43 ) = 1+M_.params(40)-M_.params(39)*M_.params(37)*M_.params(38);
gross_gamma_null = M_.params( 43 );
M_.params( 47 ) = (1+M_.params(44)-M_.params(46))*((1+M_.params(61)-M_.params(58))/M_.params(58)+M_.params(37)*M_.params(39));
lambda_x = M_.params( 47 );
M_.params( 65 ) = (M_.params(59)+M_.params(62)*(1-M_.params(59)*(1-M_.params(46))))^(-1);
phi2 = M_.params( 65 );
M_.params( 56 ) = (1-M_.params(62))*(1-M_.params(59))*(1-M_.params(46)*M_.params(59))*M_.params(65);
lambda = M_.params( 56 );
M_.params( 48 ) = (M_.params(61)+M_.params(39))*M_.params(56);
kappa_alpha = M_.params( 48 );
M_.params( 49 ) = 1.5;
phi_pi = M_.params( 49 );
M_.params( 50 ) = 0;
phi_x = M_.params( 50 );
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);       
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (2.6684)^2;
M_.Sigma_e(2, 2) = (0.6148)^2;
M_.Sigma_e(3, 3) = (0.9667)^2;
M_.Sigma_e(4, 4) = (2.9396)^2;
save('HK_FPP11_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('HK_FPP11_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('HK_FPP11_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('HK_FPP11_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('HK_FPP11_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('HK_FPP11_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('HK_FPP11_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off