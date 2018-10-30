% kate: hl Prolog;

% Mars 2012 : pour BE2 prolog (BProlog)

% Des utilitaires pour les TPs Gnu Prolog
% rediriger(+Fichier) : ce qui devait  s'afficher � l'�cran va dans 'Fichier'
% 		Attention : on ne verra plus rien � l'�cran jusqu'� l'ex�cution de
% remettre.		: r�tablit la sortie �cran
% warning :  en cas d'absence d'un pr�dicat, �chouer avec un avertissement
% reset : nettoyer la base (enlever tous les pr�dicats).
%=============================================================================================
% Pour rediriger les sorties �cran vers un fichier disque (Fic)
% La s�quence d''utilisation (en 3 temps) :
%		rediriger('toto').
%		poser_votre_question. ........
%		remettre.

% J'enl�ve pour BProlog :- built_in.

% Sous BProlog, on continue � voir mais on fait une copie dans Fic
rediriger_sorties(Fic) :-
    open(Fic,write,F),
    current_input(I),
    current_output(O),
    asserta(streams___(F,I,O)),
%'$set_top_level_streams'(I, F).
    write('la sortie redirig�e vers '), write(Fic), nl,
    set_output(F).

remettre :-
    retract(streams___(F,I,O)),
    set_output(O),
    set_input(I),
    %'$set_top_level_streams'(I, O),
    flush_output(F),	% on �crit tout
    close(F).

%----------------------------------------------------------
% demander warning+�chec si un pr�dicat n''existe pas.
echec_pred_absent :-
    set_prolog_flag(unknown, fail).	% Pour BProl (n'a pas  'warning' comme GProlg)
%	Attention : en Bprolog, il n'y a pas get_prolog_flag mais current_prolog_flag'
%----------------------------------------------------------
