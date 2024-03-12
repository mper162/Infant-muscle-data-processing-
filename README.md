**Individual File Separator & Muscle Length Calculation Tool**

The Individual File Separator script is a tool designed to extract individual ITK Snap masks from a single file containing multiple masks. This can be particularly useful when you have a file containing all segmented muscles and need to analyze them individually.

**Inputs:**
- Mask file
- Source file
- Label description file (which maps colors to muscle names)

**Label Description File Format:**
The label description file should follow this format:
```
Label ID / Red / Green / Blue / Alpha / Source / Color Interpolation / Muscle Name
```
Here's an example of the label description file:

```
1   255    0    0          1  1  1    "RF-L"
2     0  255    0          1  1  1    "VM-L"
4   255  255    0          1  1  1    "RF-R"
6   255    0  255          1  1  1    "VM-R"
7   255  239  213          1  1  1    "Sartorius-L"
8     0    0  205          1  1  1    "Sartorius-R"
18   233  150  122         1  1  1    "BF-Short-L"
19   165   42   42         1  1  1    "BF-Long-L"
20   255  250  250         1  1  1    "Gracilis-L"
21   147  112  219         1  1  1    "Semitendinosus-L"
22   218  112  214         1  1  1    "Semimembranosus-L"
23    75    0  130         1  1  1    "VI-L"
24   255  182  193         1  1  1    "VL-L"
25    60  179  113         1  1  1    "Gracilis-R"
26   255  235  205         1  1  1    "BF-Short-R"
27   255  228  196         1  1  1    "BF-Long-R"
28   218  165   32         1  1  1    "Semitendinosus-R"
29     0  128  128         1  1  1    "Semimembranosus-R"
30   188  143  143         1  1  1    "VI-R"
31   255  105  180         1  1  1    "VL-R"
```

**Usage:**
1. Place the script in your MATLAB working directory.
2. Ensure you have the source file (containing all the muscle segmented masks), the mask file, and the label description file in the same directory.
3. Run the script in MATLAB.
4. Follow the prompts to specify the source file, mask file, and label description file.
5. The script will then separate the individual masks and save them as separate files.



**Muscle Length Calculation:**

Once you have individual muscle masks, you can input them into the Muscle Length Calculation script to compute the length of each muscle.
1.Ensure that the masks are properly segmented and saved as individual files.
2.Run the script in MATLAB and specify the directory containing the individual muscle masks.
3.The script will calculate the length of each muscle and provide the results.
Note: It's essential to follow the correct file formatting and directory structure for both scripts to function properly. Make sure to read the instructions provided in the scripts and ensure that the input files are appropriately prepared.


**Note:** Make sure the source file, mask file, and label description file are correctly formatted and located in the same directory as the script for proper execution.
