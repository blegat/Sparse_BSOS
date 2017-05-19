
%% Broyden Banded Function
problem = 'DiscreteBoundary';

%% Options

%%
id = [pwd,'/'];

for N = 15:5:35
    %% generate problem
    problemtag = [problem,num2str(N)];
    eval([problemtag,';']);
    pop = const_int01(pop,'SBSOS');
    pop = const_sumlt1(pop);
    save([id,'/pops/pop',problemtag],'pop');
    pop.k = full(ceil(max(sum(F(:,1:end-1),2)/2)));
        for d = 1:3
            pop.d=d;
            if d==3
                lss(pop,problemtag,'SPUT')
            end
            lss(pop,problemtag,'SBSOS')
        end
end

