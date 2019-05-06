for i = 1:2
    img = snapshot(cam);
    image(img);
    drawnow;
end
coordinates=[];
redmin=60;
redmax=100;
greenmin=100;
greenmax=120;
bluemin=210;
bluemax=100;
newimg=zeros(480,640,3);
for i=1:480
    for j=1:640
        if img(i,j,1)<redmax & img(i,j,1)>redmin & img(i,j,2)<greenmax & img(i,j,2)>greenmin & img(i,j,3)<bluemax & img(i,j,3)>bluemin
            newimg(i,j,1)=img(i,j,1);
            newimg(i,j,2)=img(i,j,2);
            newimg(i,j,3)=img(i,j,3);
            coordinates=[coordinates;j,i];
        end
    end
end            
imtool(newimg)  
writeApiKey = 'BG878O2A1J0BBVZQ';
options = weboptions('MediaType','application/json');
thingSpeakURL = 'http://api.thingspeak.com/';
thingSpeakWriteURL = [thingSpeakURL 'update'];
fieldName = 'field1';
fieldValue = coordinates;
response = webwrite(thingSpeakWriteURL,'api_key',writeApiKey,fieldName,fieldValue)
