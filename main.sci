funcprot(0);
CHEMIN = 'C:\Users\CookieV3\Desktop\Tatouage\';
IMG1 = 'img\test.jpg';

function main()
    
    chdir(CHEMIN);
    getd('utils');
    getd('scripts');
    
    matrice_initiale = chargerImage(IMG1,1);
    matrice_initiale_freq = imageToFreq(matrice_initiale);
   
    tatouage = [  1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1;
                0,1,1,1,1,1,0;
                1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1
             ]

    matrice_marquee = production(matrice_initiale, tatouage);
    ecrireImage(matrice_marquee, 'res.png');
    
    // fonction. Permet de calculer une fft et d'afficher le module avec un log
    matrice_marquee_freq = imageToFreq(matrice_marquee);

    mat2 = chargerImage('res.png',0);
    disp(PSNR(matrice_initiale, mat2));
    
    mat3 = chargerImage('res_apres_fb.jpg',0);
    mat3_freq = imageToFreq(mat3);
    disp(PSNR(matrice_initiale, mat3));

    afficherImage([ matrice_initiale, matrice_initiale_freq;
                    matrice_marquee, matrice_marquee_freq;
                    mat3, mat3_freq]);
    //ecrireImage(img,"C:\Users\Basile Bruhat\Pictures\traitement_image\image_resultante.png")
endfunction

main()
