function resultat=waitBar()
h = waitbar(0,'Patientez...');
wbObject=findobj(h,'Type','Patch');
set(wbObject,'EdgeColor',[0 0.75 0.75],'FaceColor',[0 0.75 0.75]);
    for i=1:1000
        waitbar(i/1000,h)
    end
resultat=h;
end