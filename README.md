indiviudal file seperator is a file which seperate individual ITK snap masks from a one file which contains multiple masks. For example: let's say one file contains all the muscle segemented & ypu want to analyse masks individually. 
This scripts help to seperate them into individual masks. 
Inputs: Mask file / Source file/ Label description file(which colour translate to which muscle)
Label description file's format has to be something like the following: Label ID / colour(RGB) / / Muscle Name (This will be automatically generate dfile from ITK_Snap) Just want to chnage the formatting a little. 
1   255    0    0         1  1  1    "RF-L"
2     0  255    0         1  1  1    "VM-L"
4   255  255    0         1  1  1    "RF-R"
6   255    0  255         1  1  1    "VM-R"
7   255  239  213         1  1  1    "Sartorius-L"
8     0    0  205         1  1  1    "Sartorius-R"
18   233  150  122        1  1  1    "BF-Short-L"
19   165   42   42        1  1  1    "BF-Long-L"
20   255  250  250        1  1  1    "Gracilis-L"
21   147  112  219        1  1  1    "Semitendinosus-L"
22   218  112  214        1  1  1    "Semimembranosus-L"
23    75    0  130        1  1  1    "VI-L"
24   255  182  193        1  1  1    "VL-L"
25    60  179  113        1  1  1    "Gracilis-R"
26   255  235  205        1  1  1    "BF-Short-R"
27   255  228  196        1  1  1    "BF-Long-R"
28   218  165   32        1  1  1    "Semitendinosus-R"
29     0  128  128        1  1  1    "Semimembranosus-R"
30   188  143  143        1  1  1    "VI-R"
31   255  105  180        1  1  1    "VL-R"
