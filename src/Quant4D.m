classdef Quant4D < matlab.apps.App

    % Used to locate and load the app's XML configuration file
    properties (Access = public, Constant)
        AppConfigFilename = './Quant4D.xml'; % File path to the app configuration file containing component layout and settings
    end

    % Properties that correspond to app components
    properties (Access = public)
        Quant4D_Fig                     matlab.ui.Figure
        diffraction_dropdown            matlab.ui.control.DropDown
        Quant4D_FigGrid                 matlab.ui.container.GridLayout
        ShortcutButtonGrid              matlab.ui.container.GridLayout
        ShowImportWindow                matlab.ui.control.Button
        ShowSaveWindow                  matlab.ui.control.Button
        AutoSaveImage                   matlab.ui.control.Button
        UpdateImages                    matlab.ui.control.Button
        ShowSettingsWindow              matlab.ui.control.Button
        ModeGrid                        matlab.ui.container.GridLayout
        Mode                            matlab.ui.control.DropDown
        ModePanel                       matlab.ui.container.Panel
        RealPanelGrid                   matlab.ui.container.GridLayout
        RealPanel                       matlab.ui.container.Panel
        RealGrid                        matlab.ui.container.GridLayout
        RealROIInvert                   matlab.ui.control.StateButton
        ShowRealMaskWindow              matlab.ui.control.Button
        RealROIGrid                     matlab.ui.container.GridLayout
        RealYLabel                      matlab.ui.control.Label
        RealROIFrameY                   matlab.ui.control.Spinner
        RealXLabel                      matlab.ui.control.Label
        RealROIFrameX                   matlab.ui.control.Spinner
        RealROIFrameLabel               matlab.ui.control.Label
        RealROIShape                    matlab.ui.control.DropDown
        ModeTabGroup                    matlab.ui.container.TabGroup
        PreviewTab                      matlab.ui.container.Tab
        PreviewGrid                     matlab.ui.container.GridLayout
        PreviewFramePanel               matlab.ui.container.Panel
        PreviewButtonGrid               matlab.ui.container.GridLayout
        PreviewFrame_1_1                matlab.ui.control.Button
        PreviewFrame_X2_1               matlab.ui.control.Button
        PreviewFrame_X_1                matlab.ui.control.Button
        PreviewFrame_1_Y2               matlab.ui.control.Button
        PreviewFrame_X2_Y2              matlab.ui.control.Button
        PreviewFrame_X_Y2               matlab.ui.control.Button
        PreviewFrame_1_Y                matlab.ui.control.Button
        PreviewFrame_X2_Y               matlab.ui.control.Button
        PreviewFrame_X_Y                matlab.ui.control.Button
        PreviewFrameGrid                matlab.ui.container.GridLayout
        PvFrXLabel                      matlab.ui.control.Label
        PreviewFrameX                   matlab.ui.control.Spinner
        PvFrYLabel                      matlab.ui.control.Label
        PreviewFrameY                   matlab.ui.control.Spinner
        PreviewButton                   matlab.ui.control.Button
        AlignmentTab                    matlab.ui.container.Tab
        AlignmentGrid                   matlab.ui.container.GridLayout
        DiffractionCalibrationPanel     matlab.ui.container.Panel
        DiffractionCalibrationGrid      matlab.ui.container.GridLayout
        ConvergenceAngleLabel           matlab.ui.control.Label
        Alpha                           matlab.ui.control.NumericEditField
        AlphaLabel                      matlab.ui.control.Label
        DiffractionScaleLabel           matlab.ui.control.Label
        mradPx                          matlab.ui.control.NumericEditField
        mradPxLabel                     matlab.ui.control.Label
        AlignmentHelpIcon               matlab.ui.control.Image
        TransBeamAlignPanel             matlab.ui.container.Panel
        TransBeamAlignGrid              matlab.ui.container.GridLayout
        TBAutoAlign                     matlab.ui.control.Button
        TBCrossAlign                    matlab.ui.control.Button
        TBRLabel                        matlab.ui.control.Label
        TransBeamRSpinner               matlab.ui.control.Spinner
        TBR_NFLabel                     matlab.ui.control.Label
        TransBeamR                      matlab.ui.control.Slider
        TBXLabel                        matlab.ui.control.Label
        TransBeamXSpinner               matlab.ui.control.Spinner
        TBX_NFLabel                     matlab.ui.control.Label
        TransBeamX                      matlab.ui.control.Slider
        TBYLabel                        matlab.ui.control.Label
        TransBeamYSpinner               matlab.ui.control.Spinner
        TBY_NFLabel                     matlab.ui.control.Label
        TransBeamY                      matlab.ui.control.Slider
        AnnularDetectorTab              matlab.ui.container.Tab
        AnnularDetectorGrid             matlab.ui.container.GridLayout
        AnnularRadiiPanel               matlab.ui.container.Panel
        AnnularRadiiGrid                matlab.ui.container.GridLayout
        AnnRiLabel                      matlab.ui.control.Label
        InnerAnnularRadiusSpinner       matlab.ui.control.Spinner
        AnnRi_NFLabel                   matlab.ui.control.Label
        InnerAnnularRadius              matlab.ui.control.Slider
        AnnularRadiusLink               matlab.ui.control.StateButton
        AnnRoLabel                      matlab.ui.control.Label
        OuterAnnularRadiusSpinner       matlab.ui.control.Spinner
        AnnRo_NFLabel                   matlab.ui.control.Label
        OuterAnnularRadius              matlab.ui.control.Slider
        ScanDirectionPanel              matlab.ui.container.Panel
        ScanDirectionGrid               matlab.ui.container.GridLayout
        ScanDirectionLock               matlab.ui.control.StateButton
        AutoCurl                        matlab.ui.control.Button
        ScanDirLabel                    matlab.ui.control.Label
        ScanDirectionSpinner            matlab.ui.control.Spinner
        ScanDir_NFLabel                 matlab.ui.control.Label
        FlipScanDirectionY              matlab.ui.control.StateButton
        ScanDirectionSlider             matlab.ui.control.Slider
        SegmentedDetectorPanel          matlab.ui.container.Panel
        SegmentedDetectorGrid           matlab.ui.container.GridLayout
        SegmentsLabel                   matlab.ui.control.Label
        NSeg                            matlab.ui.control.Spinner
        RungsLabel                      matlab.ui.control.Label
        NRung                           matlab.ui.control.Spinner
        DetRotLabel                     matlab.ui.control.Label
        DetectorRotationSpinner         matlab.ui.control.Spinner
        DetRot_NFLabel                  matlab.ui.control.Label
        DetectorRotationSlider          matlab.ui.control.Slider
        AnnularStepGrid                 matlab.ui.container.GridLayout
        AnnularStepLabel                matlab.ui.control.Label
        AnnularStep                     matlab.ui.control.NumericEditField
        VirtualApertureTab              matlab.ui.container.Tab
        VirtualApertureGrid             matlab.ui.container.GridLayout
        VirtualApertureCoordinatesPanel  matlab.ui.container.Panel
        VirtualApertureCoordinatesGrid  matlab.ui.container.GridLayout
        VrApRLabel                      matlab.ui.control.Label
        VirtualApertureRSpinner         matlab.ui.control.Spinner
        VrApR_NFLabel                   matlab.ui.control.Label
        VirtualApertureR                matlab.ui.control.Slider
        VrApXLabel                      matlab.ui.control.Label
        VirtualApertureXSpinner         matlab.ui.control.Spinner
        VrApX_NFLabel                   matlab.ui.control.Label
        VirtualApertureX                matlab.ui.control.Slider
        VrApYLabel                      matlab.ui.control.Label
        VirtualApertureYSpinner         matlab.ui.control.Spinner
        VrApY_NFLabel                   matlab.ui.control.Label
        VirtualApertureY                matlab.ui.control.Slider
        VirtualApertureRotationGrid     matlab.ui.container.GridLayout
        VirtualApertureReset            matlab.ui.control.Button
        VirtualApertureRotateCCW        matlab.ui.control.Button
        VirtualApertureRotationStep     matlab.ui.control.DropDown
        VirtualApertureRotateCW         matlab.ui.control.Button
        VirtualApertureInvert           matlab.ui.control.StateButton
        VirtualApertureSymmetryPanel    matlab.ui.container.Panel
        VirtualApertureSymmetryGrid     matlab.ui.container.GridLayout
        VrApSymmLabel                   matlab.ui.control.Label
        VirtualApertureSymmetry         matlab.ui.control.DropDown
        VirtualApertureMirrorGrid       matlab.ui.container.GridLayout
        VirtualApertureMirror           matlab.ui.control.StateButton
        VrApMirrRotLabel                matlab.ui.control.Label
        VirtualApertureMirrorRotationSpinner  matlab.ui.control.Spinner
        VrApMirrRot_NFLabel             matlab.ui.control.Label
        VirtualApertureMirrorRotation   matlab.ui.control.Slider
        CustomDetectorTab               matlab.ui.container.Tab
        CustomDetectorGrid              matlab.ui.container.GridLayout
        CustomDetectorNewMaskGrid       matlab.ui.container.GridLayout
        CustomDetectorNewCircle         matlab.ui.control.Button
        CustomDetectorNewGrid           matlab.ui.control.Button
        CustomDetectorNewBandpass       matlab.ui.control.Button
        CustomDetectorNewWedge          matlab.ui.control.Button
        CustomDetectorNewPolygon        matlab.ui.control.Button
        CustomDetectorNewFromFile       matlab.ui.control.Button
        CustomDetectorNewMath           matlab.ui.control.Button
        CustomDetectorNewGridNoCenter   matlab.ui.control.Button
        CustomDetectorInterMaskGrid     matlab.ui.container.GridLayout
        ShowDiffractionMaskWindow       matlab.ui.control.Button
        IntermaskLabel                  matlab.ui.control.Label
        CustomDetectorInterMask         matlab.ui.control.DropDown
        CustomDetectorDeleteMask        matlab.ui.control.Button
        CustomDetectorTable             matlab.ui.control.Table
        CustomDetectorDetailsPanel      matlab.ui.container.Panel
        CustomDetectorDetailsGrid       matlab.ui.container.GridLayout
        CustomDetectorRotationGrid      matlab.ui.container.GridLayout
        CDIntraCombLabel                matlab.ui.control.Label
        CustomDetectorIntraMask         matlab.ui.control.DropDown
        CustomDetectorRotationStep      matlab.ui.control.DropDown
        CustomDetectorRotateCCW         matlab.ui.control.Button
        CustomDetectorRotateCW          matlab.ui.control.Button
        CustomDetectorMirror            matlab.ui.control.StateButton
        CustomDetectorDetailsTable      matlab.ui.control.Table
        CustomDetectorInvert            matlab.ui.control.StateButton
        CustomDetectorColor             matlab.ui.control.Button
        CustomDetectorFlipHorizontal    matlab.ui.control.StateButton
        CustomDetectorFlipVertical      matlab.ui.control.StateButton
        CustomDetectorTranspose         matlab.ui.control.StateButton
        SettingsPanel                   matlab.ui.container.Panel
        SettingsGrid                    matlab.ui.container.GridLayout
        SettingsTabGroup                matlab.ui.container.TabGroup
        DisplayTab                      matlab.ui.container.Tab
        DisplayGrid                     matlab.ui.container.GridLayout
        DisplayDropDownGrid             matlab.ui.container.GridLayout
        ShowImageWindow                 matlab.ui.control.Button
        ImageLabel                      matlab.ui.control.Label
        DisplayImage                    matlab.ui.control.DropDown
        DisplayLock                     matlab.ui.control.StateButton
        ColormapLabel                   matlab.ui.control.Label
        DispColorMap                    matlab.ui.control.DropDown
        DispColorMapInvert              matlab.ui.control.StateButton
        ImageStatistics                 matlab.ui.control.TextArea
        HistogramGrid                   matlab.ui.container.GridLayout
        HistogramLog                    matlab.ui.control.StateButton
        HistogramAxes                   matlab.ui.control.UIAxes
        DispContrastsGrid               matlab.ui.container.GridLayout
        DisplayBrightnessReset          matlab.ui.control.Button
        DisplayBrightness               matlab.ui.control.Slider
        DisplayBrightnessSpinner        matlab.ui.control.Spinner
        DisplayContrastReset            matlab.ui.control.Button
        DisplayContrast                 matlab.ui.control.Slider
        DisplayContrastSpinner          matlab.ui.control.Spinner
        DisplayGammaReset               matlab.ui.control.Button
        DisplayGamma                    matlab.ui.control.Slider
        DisplayGammaSpinner             matlab.ui.control.Spinner
        ShowMaskWindow                  matlab.ui.control.Button
        DisplayMaskOpacitySlider        matlab.ui.control.Slider
        DisplayMaskOpacitySpinner       matlab.ui.control.Spinner
        WindowsTab                      matlab.ui.container.Tab
        WindowsTabGrid                  matlab.ui.container.GridLayout
        BandpassFilterPanel             matlab.ui.container.Panel
        BandpassFilterGrid              matlab.ui.container.GridLayout
        BandpassFilter                  matlab.ui.control.RangeSlider
        BandpassFilterHigh              matlab.ui.control.Spinner
        BandpassFilterLow               matlab.ui.control.Spinner
        ShowImageWindowsPanel           matlab.ui.container.Panel
        ShowImageWindowsGrid            matlab.ui.container.GridLayout
        ShowDiffractionWindow           matlab.ui.control.Button
        ShowDiffractionMaskWindow2      matlab.ui.control.Button
        ShowRealWindow                  matlab.ui.control.Button
        ShowRealMaskWindow2             matlab.ui.control.Button
        ShowColorWheelWindow            matlab.ui.control.Button
        ShowCoMPhaseMagnitudeWindow     matlab.ui.control.Button
        ShowCoMPhaseWindow              matlab.ui.control.Button
        ShowCoMMagnitudeWindow          matlab.ui.control.Button
        ShowCoMXWindow                  matlab.ui.control.Button
        ShowCoMYWindow                  matlab.ui.control.Button
        ShowdCoMWindow                  matlab.ui.control.Button
        ShowiCoMWindow                  matlab.ui.control.Button
        VectorSamplingGrid              matlab.ui.container.GridLayout
        DispVecFieldLabel               matlab.ui.control.Label
        DisplayVectorField              matlab.ui.control.DropDown
        DisplayVectorColor              matlab.ui.control.Button
        WindowResizePanel               matlab.ui.container.Panel
        WindowResizeGrid                matlab.ui.container.GridLayout
        WindowResizeTabGroup            matlab.ui.container.TabGroup
        DiffractionTab                  matlab.ui.container.Tab
        DiffractionTabGrid              matlab.ui.container.GridLayout
        DiffractionWindowPanel          matlab.ui.container.Panel
        DiffractionWindowGrid           matlab.ui.container.GridLayout
        DiffractionAxesGrid             matlab.ui.container.GridLayout
        ShowDiffractionAxes             matlab.ui.control.StateButton
        ReverseDiffractionX             matlab.ui.control.StateButton
        ReverseDiffractionY             matlab.ui.control.StateButton
        RotateDiffractionIcon           matlab.ui.control.Image
        RotateDiffraction               matlab.ui.control.DropDown
        WEditFieldLabel                 matlab.ui.control.Label
        SetDiffractionWindowWidth       matlab.ui.control.NumericEditField
        HEditFieldLabel                 matlab.ui.control.Label
        SetDiffractionWindowHeight      matlab.ui.control.NumericEditField
        SetDiffractionWindow            matlab.ui.control.Button
        SetAllDiffractionWindows        matlab.ui.control.Button
        RealspaceTab                    matlab.ui.container.Tab
        RealspaceTabGrid                matlab.ui.container.GridLayout
        RealWindowPanel                 matlab.ui.container.Panel
        RealWindowGrid                  matlab.ui.container.GridLayout
        RealAxesGrid                    matlab.ui.container.GridLayout
        ShowRealAxes                    matlab.ui.control.StateButton
        ReverseRealX                    matlab.ui.control.StateButton
        ReverseRealY                    matlab.ui.control.StateButton
        RotateRealIcon                  matlab.ui.control.Image
        RotateReal                      matlab.ui.control.DropDown
        HEditField_2Label               matlab.ui.control.Label
        SetRealWindowHeight             matlab.ui.control.NumericEditField
        SetRealWindow                   matlab.ui.control.Button
        SetAllRealWindows               matlab.ui.control.Button
        WEditField_2Label               matlab.ui.control.Label
        SetRealWindowWidth              matlab.ui.control.NumericEditField
        MiscTab                         matlab.ui.container.Tab
        MiscGrid                        matlab.ui.container.GridLayout
        LiveUpdateImagesGrid            matlab.ui.container.GridLayout
        CalculationPolicyIcon           matlab.ui.control.Image
        CalculationPolicyDropDownLabel  matlab.ui.control.Label
        CalculationPolicy               matlab.ui.control.DropDown
        DetectorCoordinatePanel         matlab.ui.container.Panel
        DetectorCoordinateGrid          matlab.ui.container.GridLayout
        DetectorCoordinateSystem        matlab.ui.control.DropDown
        DetectorCoordinatePosition      matlab.ui.control.DropDown
        DetectorCoordinateUnit          matlab.ui.control.DropDown
        DatasetOptionPanel              matlab.ui.container.Panel
        DatasetOptionGrid               matlab.ui.container.GridLayout
        SwapByteOrder                   matlab.ui.control.Button
        SwapDiffractionXY               matlab.ui.control.Button
        SwapRealXY                      matlab.ui.control.Button
        InfoTab                         matlab.ui.container.Tab
        InfoGrid                        matlab.ui.container.GridLayout
        DatasetInfoTextAreaLabel        matlab.ui.control.Label
        DatasetInfo                     matlab.ui.control.TextArea
        ShowVariables                   matlab.ui.control.StateButton
        MathTab                         matlab.ui.container.Tab
        MathGrid                        matlab.ui.container.GridLayout
        MathExampleGrid                 matlab.ui.container.GridLayout
        MathExample                     matlab.ui.control.Label
        MathHelpIcon                    matlab.ui.control.Image
        FormulaLabel                    matlab.ui.control.Label
        MathFormula                     matlab.ui.control.TextArea
        EvaluateGrid                    matlab.ui.container.GridLayout
        Evaluate                        matlab.ui.control.Button
        VariablesTab                    matlab.ui.container.Tab
        VariablesGrid                   matlab.ui.container.GridLayout
        VariablesTable                  matlab.ui.control.Table
        VariablesTree                   matlab.ui.container.Tree
        ImportPanel                     matlab.ui.container.Panel
        ImportGrid                      matlab.ui.container.GridLayout
        ImportFileGrid                  matlab.ui.container.GridLayout
        ImportFileSelect                matlab.ui.control.Button
        ImportFilePath                  matlab.ui.control.EditField
        ImportDatasetInfoPanel          matlab.ui.container.Panel
        ImportDatasetInfoGrid           matlab.ui.container.GridLayout
        FileTypeButtonGroup             matlab.ui.container.ButtonGroup
        Custom                          matlab.ui.control.ToggleButton
        HDF5                            matlab.ui.control.ToggleButton
        DM34                            matlab.ui.control.ToggleButton
        MRC                             matlab.ui.control.ToggleButton
        Medipix                         matlab.ui.control.ToggleButton
        EMPAD                           matlab.ui.control.ToggleButton
        ImportDatasetStructureGrid      matlab.ui.container.GridLayout
        SubdatasetDropDownLabel         matlab.ui.control.Label
        SubDataset                      matlab.ui.control.DropDown
        DataOffsetLabel                 matlab.ui.control.Label
        DatasetOffset                   matlab.ui.control.NumericEditField
        FrameHeaderLabel                matlab.ui.control.Label
        DataHeader                      matlab.ui.control.NumericEditField
        FrameFooterLabel                matlab.ui.control.Label
        DataFooter                      matlab.ui.control.NumericEditField
        DataTypeLabel                   matlab.ui.control.Label
        ImportDataType                  matlab.ui.control.DropDown
        ByteOrderDropDownLabel          matlab.ui.control.Label
        ImportByteOrder                 matlab.ui.control.DropDown
        AxisOrderingLabel               matlab.ui.control.Label
        ImportAxisOrder                 matlab.ui.control.DropDown
        ImportDimensionGrid             matlab.ui.container.GridLayout
        XLabel_2                        matlab.ui.control.Label
        ImportPixelsX                   matlab.ui.control.NumericEditField
        YLabel_2                        matlab.ui.control.Label
        ImportPixelsY                   matlab.ui.control.NumericEditField
        XLabel                          matlab.ui.control.Label
        ImportFramesX                   matlab.ui.control.NumericEditField
        YLabel                          matlab.ui.control.Label
        ImportFramesY                   matlab.ui.control.NumericEditField
        ImportFileSizeGrid              matlab.ui.container.GridLayout
        ImportActualFilesizeLabel       matlab.ui.control.Label
        ImportActualFilesize            matlab.ui.control.Label
        ImportEstimatedFilesizeLabel    matlab.ui.control.Label
        ImportEstimatedFilesize         matlab.ui.control.Label
        DatasetInfofromMetadataLabel    matlab.ui.control.Label
        ImportFileMetadata              matlab.ui.control.TextArea
        ImportOptionsPanel              matlab.ui.container.Panel
        ImportOptionsGrid               matlab.ui.container.GridLayout
        MemoryGrid                      matlab.ui.container.GridLayout
        MemoryType                      matlab.ui.control.DropDown
        GPU                             matlab.ui.control.DropDown
        ImportPartialPixels             matlab.ui.control.CheckBox
        ImportPartialFrames             matlab.ui.control.CheckBox
        DiffractionPartialImportGrid    matlab.ui.container.GridLayout
        BinningDistanceLabel            matlab.ui.control.Label
        DiffractionPartialImportPixelsDist  matlab.ui.control.Spinner
        xsub1Label_5                    matlab.ui.control.Label
        DiffractionPartialImportXStart  matlab.ui.control.Spinner
        ysub1Label_5                    matlab.ui.control.Label
        DiffractionPartialImportYStart  matlab.ui.control.Spinner
        XLabel_3                        matlab.ui.control.Label
        DiffractionPartialImportX       matlab.ui.control.Spinner
        YLabel_3                        matlab.ui.control.Label
        DiffractionPartialImportY       matlab.ui.control.Spinner
        RealPartialImportGrid           matlab.ui.container.GridLayout
        SamplingIntervalLabel_2         matlab.ui.control.Label
        RealPartialImportFramesDist     matlab.ui.control.Spinner
        xsub1Label_6                    matlab.ui.control.Label
        RealPartialImportXStart         matlab.ui.control.Spinner
        ysub1Label_6                    matlab.ui.control.Label
        RealPartialImportYStart         matlab.ui.control.Spinner
        INFrXl                          matlab.ui.control.Label
        RealPartialImportX              matlab.ui.control.Spinner
        INFrYl                          matlab.ui.control.Label
        RealPartialImportY              matlab.ui.control.Spinner
        ImportSummaryLabel              matlab.ui.control.Label
        ImportSummary                   matlab.ui.control.TextArea
        ImportButtonGrid                matlab.ui.container.GridLayout
        ImportData                      matlab.ui.control.Button
        SwapDataset                     matlab.ui.control.CheckBox
        CancelImport                    matlab.ui.control.Button
        SavePanel                       matlab.ui.container.Panel
        SaveGrid                        matlab.ui.container.GridLayout
        SaveDirectoryGrid               matlab.ui.container.GridLayout
        SaveDirectoryButton             matlab.ui.control.Button
        SaveDirectoryPath               matlab.ui.control.EditField
        SaveTabGroup                    matlab.ui.container.TabGroup
        SaveImagesTab                   matlab.ui.container.Tab
        SaveImagesGrid                  matlab.ui.container.GridLayout
        SaveImagePrefixGrid             matlab.ui.container.GridLayout
        FilenamePrefixLabel             matlab.ui.control.Label
        SaveImagePrefix                 matlab.ui.control.EditField
        SavePrefixAngleGrid             matlab.ui.container.GridLayout
        SavePrefixAngleLabel            matlab.ui.control.Label
        SavePrefixAngleInner            matlab.ui.control.CheckBox
        SavePrefixAngleOuter            matlab.ui.control.CheckBox
        SaveImageListGrid               matlab.ui.container.GridLayout
        ImagestoSaveMultiselectwithCtrlShiftLabel  matlab.ui.control.Label
        SaveImageSelectAll              matlab.ui.control.CheckBox
        SaveImageList                   matlab.ui.control.ListBox
        SaveImageFormatGrid             matlab.ui.container.GridLayout
        SaveImageTIFF                   matlab.ui.control.CheckBox
        SaveImagePNGGrid                matlab.ui.container.GridLayout
        SaveImagePNG                    matlab.ui.control.CheckBox
        SaveImageAnnotations            matlab.ui.control.CheckBox
        SaveImgAnnotDPILabel            matlab.ui.control.Label
        SaveImageDPI                    matlab.ui.control.NumericEditField
        ExportDatasetTab                matlab.ui.container.Tab
        ExportGrid                      matlab.ui.container.GridLayout
        ExportFileGrid                  matlab.ui.container.GridLayout
        FilenameLabel                   matlab.ui.control.Label
        ExportFilename                  matlab.ui.control.EditField
        ExportDimensionSuffix           matlab.ui.control.CheckBox
        ExportDataType                  matlab.ui.control.DropDown
        ExportByteOrder                 matlab.ui.control.DropDown
        ExportPartialPixels             matlab.ui.control.CheckBox
        DiffractionPartialExportGrid    matlab.ui.container.GridLayout
        BinningDistanceLabel_2          matlab.ui.control.Label
        DiffractionPartialExportPixelsDist  matlab.ui.control.Spinner
        xsub1Label_3                    matlab.ui.control.Label
        DiffractionPartialExportXStart  matlab.ui.control.Spinner
        ysub1Label_3                    matlab.ui.control.Label
        DiffractionPartialExportYStart  matlab.ui.control.Spinner
        ENPxXl                          matlab.ui.control.Label
        DiffractionPartialExportX       matlab.ui.control.Spinner
        ENPxYl                          matlab.ui.control.Label
        DiffractionPartialExportY       matlab.ui.control.Spinner
        RealPartialExportGrid           matlab.ui.container.GridLayout
        xsub1Label_4                    matlab.ui.control.Label
        RealPartialExportXStart         matlab.ui.control.Spinner
        ysub1Label_4                    matlab.ui.control.Label
        RealPartialExportYStart         matlab.ui.control.Spinner
        ENFrXl                          matlab.ui.control.Label
        RealPartialExportX              matlab.ui.control.Spinner
        ENFrYl                          matlab.ui.control.Label
        RealPartialExportY              matlab.ui.control.Spinner
        SamplingIntervalLabel           matlab.ui.control.Label
        RealPartialExportFramesDist     matlab.ui.control.Spinner
        SummaryLabel                    matlab.ui.control.Label
        ExportNotes                     matlab.ui.control.TextArea
        ExportPartialFrames             matlab.ui.control.CheckBox
        SaveExportButtonGrid            matlab.ui.container.GridLayout
        SaveExport                      matlab.ui.control.Button
        SaveCloseButton                 matlab.ui.control.Button
        DebugContextMenu                matlab.ui.container.ContextMenu
        Test1Menu                       matlab.ui.container.Menu
        Test2Menu                       matlab.ui.container.Menu
        SaveVecMenu                     matlab.ui.container.Menu
        ReimportMenu                    matlab.ui.container.Menu
        ResetQuant4DMenu                matlab.ui.container.Menu
        EnableallUIsMenu                matlab.ui.container.Menu
        CDDelContext                    matlab.ui.container.ContextMenu
        CDDelResetMenu                  matlab.ui.container.Menu
    end

    properties (Access = public)
        debug = false                                                   % bool : Debug mode. false to disable; else enables timers/tracers
        data                                                            % array : Imported dataset, may be moved to GPU
        memfile                                                         % memmapfile : Memory map file of the imported dataset
        sys_constants                                                   % struct : Constants for system info that set at app startup
        tmp_variables                                                   % struct : Temporary global variables, e.g. for progress bar and import etc., should never be cleared
        dataset_parameters                                              % struct : Parameters of the current imported dataset; should be constants (except for data type conversion)
        common_parameters                                               % struct : Common parameters, should be cleared when a dataset is unloaded
        previous_values                                                 % struct : Previous values, should be cleared when a dataset is unloaded
        figures                                                         % struct : All figure windows excluding the Main UI
        image_axes                                                      % struct : All image axes
        images                                                          % struct : Arrays of raw data for the images/masks to be plotted/saved
        image_displays                                                  % struct : Image objects with modified contrast for display, e.g. by ``app.image_displays.(id) = imagesc(...)``
        annotations                                                     % struct : Image annotations on `axes` or `uiaxes`, excluding annotations on `figure` and `uifigure`
        masks                                                           % struct : Real and Diffraction space masks applied to data
        ui_groups                                                       % struct : Different groups of figures/axes/images; assigned just once at startup in create_other_windows()
        center = [0 0];                                                 % [int int] : Central beam absolute pixel coordinates
        center_rel = [0 0];                                             % [int int] : Relative position of center. [0 0] (when "Absolute" position) or center (when "Relative")
        diff_scale = 1;                                                 % double : Diffraction pixel scale. 1 (when in pixel) or mrad/px (when in mrad)
        real_scale = 1;                                                 % double : Real-space pixel scale. 1 (when in pixel) or nm/px (when in nm). Not implemented yet
        variable_nodes                                                  % struct : uitree nodes to display variables for users
        byte_size =  ...                                                % struct : size of each supported data type in bytes
                    struct("uint8", 1, ...                              
                           "int8", 1, ...
                           "uint16", 2, ...
                           "int16", 2, ...
                           "single", 4, ...
                           "int32", 4, ...
                           "uint32", 4, ...
                           "double", 8, ...
                           "int64", 8, ...
                           "uint64", 8);
    end

    methods (Access = public)

        function enable_virtual_aperture_UI(app)
            % Function to update UI enable/disable states
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None
        
            % Enable/Disable mirror UIs, except `app.VirtualApertureMirror`
            set(setdiff(app.VirtualApertureMirrorGrid.Children,app.VirtualApertureMirror), ...
                "Enable", switch_on_off(app, app.VirtualApertureMirror.Value))
        end

        function limit_virtual_aperture_UI(app)
            % Function to update UIs Limits/Labels for coordinate options
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None
        
            % set virtual aperture step size to 1/4 diffraction scale (mrad/pixel)
            step_size = 0.25*app.diff_scale; 
            unit = app.DetectorCoordinateUnit.Value;
        
            % reflect the coordinate system choice in the UI elements
            if app.DetectorCoordinateSystem.Value == "Polar"
                x_limits = [0, min([app.center, app.dataset_parameters.n_pixels-app.center]*2^.5)*app.diff_scale];
                y_limits = [-1 1]*180;
                x_text = 'Distance';
                y_text = 'Rotation';
                y_unit = '°'; 
                y_step = 4;
            else
                x_limits = (app.TransBeamX.Limits-app.center_rel(1))*app.diff_scale;
                y_limits = (app.TransBeamY.Limits-app.center_rel(2))*app.diff_scale;
                x_text = 'X'; 
                y_text = 'Y';
                y_unit = unit;
                y_step = step_size;
            end
            
            % update limits for sliders and numeric spinners
            set([app.VirtualApertureX; ...
                 app.VirtualApertureXSpinner; ...
                 app.VirtualApertureY; ...
                 app.VirtualApertureYSpinner; ...
                 app.VirtualApertureRSpinner], ...
                {"Limits"}, ...
                {x_limits; ...
                 x_limits; ...
                 y_limits; ...
                 y_limits; ...
                 app.TransBeamR.Limits*app.diff_scale})
        
            % update labels
            set([app.VrApXLabel; ...
                 app.VrApYLabel; ...
                 app.VrApX_NFLabel; ...
                 app.VrApY_NFLabel; ...
                 app.VrApR_NFLabel], ...
                {'Text'}, ...
                {x_text; ...
                 y_text; ...
                 unit; ...
                 y_unit; ...
                 unit})
        
            % update step size for numeric spinner
            set([app.VirtualApertureXSpinner; ...
                 app.VirtualApertureYSpinner; ...
                 app.VirtualApertureRSpinner], ...
                {'Step'}, ...
                {step_size; ...
                 y_step; ...
                 step_size})
        end

        function draw_virtual_aperture_annotation(app)
            % Function to draw virtual aperture annotations
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None
            
                % clear any previous virtual aperture annotations
                delete(findobj(app.image_axes.Diffraction, "Tag","VrApertAnnot"))
            
                % plot the apertures, and only allow the first one to be interactive
                app.annotations.VrAp = gobjects(app.VirtualApertureSymmetry.Value*(1+app.VirtualApertureMirror.Value), 1);
                for i = 1:numel(app.annotations.VrAp)
                    app.annotations.VrAp(i) = drawcircle(app.image_axes.Diffraction, ...
                                                         "Center", app.common_parameters.virtual_aperture_center, ...
                                                         "Radius", app.VirtualApertureR.Value, ...
                                                         "Color","r", ...
                                                         "FaceAlpha", 0, ...
                                                         "Deletable", 0, ...
                                                         "InteractionsAllowed", "none", ...
                                                         "Tag","VrApertAnnot");
                end
                
                % Make sure the draggable annotations are at the front
                bringToFront(app.annotations.VrAp(1));
            
                % set aperture annotation parameters
                set(app.annotations.VrAp(1), ...
                    "InteractionsAllowed", "all", ...
                    "DrawingArea", "unlimited")
                
                % add listeners to main virtual aperture annotation
                app.annotations.VrAp(1).UserData.Move = addlistener(app.annotations.VrAp(1), "ROIMoved", @app.move_virtual_aperture);
                addlistener(app.annotations.VrAp(1), "MovingROI", @app.move_virtual_aperture);
            
                % Mirror line/point annotations
                app.annotations.VrApMirL = drawline(app.image_axes.Diffraction, ...
                                                    "Position", [0 0; app.dataset_parameters.n_pixels], ...
                                                    "Color", [0 0.7 0], ...
                                                    "StripeColor", "k", ...
                                                    "LineWidth", 1.5, ...
                                                    "EdgeAlpha", 0.7, ...
                                                    "InteractionsAllowed", "none", ...
                                                    "Visible", app.VirtualApertureMirror.Value, ...
                                                    "Deletable", false, ...
                                                    "Tag","VrApertAnnot");
            
                app.annotations.VrApMirP = drawpoint(app.image_axes.Diffraction, ...
                                                     "Position", [min(app.dataset_parameters.n_pixels)/4 0] + app.center, ...
                                                     "Color", "g", ...
                                                     "MarkerSize", 8, ...
                                                     "Visible", app.VirtualApertureMirror.Value, ...
                                                     "Deletable", 0, ...
                                                     "Tag", "VrApertAnnot");
            
                % add listeners to the mirror line point
                app.annotations.VrApMirP.UserData.Move = addlistener(app.annotations.VrApMirP, "ROIMoved", @app.move_virtual_aperture);
                addlistener(app.annotations.VrApMirP, "MovingROI", @app.move_virtual_aperture);
            end

        function move_virtual_aperture(app, source, event)
            % Live update function for virtual aperture annotations
            %
            % Parameters:
            %    app (Quant4D)
            %    source (images.roi.Circle | images.roi.Point) : virtual aperture annotations
            %    event (event.EventData) : ROIMoved, MovingROI
            %
            % Returns:
            %    None
        
            % To determine real-time values
            transmitted_beam_center = app.center_rel;
            scale = app.diff_scale;
            num_pix = app.dataset_parameters.n_pixels;
            mirror_angle = app.VirtualApertureMirrorRotation.Value;
            radius = app.VirtualApertureR.Value;
            virtual_aperture_center = app.common_parameters.virtual_aperture_center;
            
            switch source
                case app.annotations.VrAp(1)
                    radius = source.Radius;
                    virtual_aperture_center = source.Center;
            
                case {app.VirtualApertureX app.VirtualApertureXSpinner app.VirtualApertureY app.VirtualApertureYSpinner}
                    % Potentially converting from polar/relative/mrad to Cartesian absolute pixel coordinates
                    x = app.VirtualApertureX.Value;
                    y = app.VirtualApertureY.Value;
            
                    if ismember(source, [app.VirtualApertureX app.VirtualApertureXSpinner])
                        x = event.Value;
                    else
                        y = event.Value;
                    end
            
                    if app.DetectorCoordinateSystem.Value == "Cartesian"
                        virtual_aperture_center = [x y]/scale + transmitted_beam_center;
                    else
                        [x,y] = pol2cart(deg2rad(y), x/scale);
                        virtual_aperture_center = app.center+[x y];
                    end
            
                case app.VirtualApertureR
                    radius = event.Value;
            
                case app.VirtualApertureRSpinner
                    radius = event.Value/scale;
            
                case app.VirtualApertureReset
                    radius = app.TransBeamR.Value;
                    virtual_aperture_center = transmitted_beam_center;
            
                case {app.VirtualApertureRotateCCW app.VirtualApertureRotateCW} % Rotation buttons
                    % Clockwise if odd numbers of "Reverse X"
                    % "Reverse Y" "Rotate Clockwise" are true
                    rot = app.VirtualApertureRotationStep.Value * (1-2*rem(app.ReverseDiffractionX.Value+app.ReverseDiffractionY.Value+(source == app.VirtualApertureRotateCW), 2));
                    virtual_aperture_center = (virtual_aperture_center-transmitted_beam_center)*rotation_matrix(app, rot)+transmitted_beam_center;
            
                case {app.VirtualApertureMirrorRotation app.VirtualApertureMirrorRotationSpinner}
                    % update the mirror line position
                    mirror_angle = event.Value;
            
                case app.annotations.VrApMirP
                    mirror_position = source.Position - transmitted_beam_center;
                    mirror_angle = atan2d(mirror_position(2), mirror_position(1));
            end
            
            % Restrict aperture location/size
            radius = min(radius, app.common_parameters.max_radius);
            virtual_aperture_center(virtual_aperture_center > num_pix) = num_pix(virtual_aperture_center > num_pix);
            virtual_aperture_center(virtual_aperture_center < 1) = 1;
            app.common_parameters.virtual_aperture_center = virtual_aperture_center;
            
            % Update GUI with Limits check
            xy_limits = [app.VirtualApertureX.Limits; app.VirtualApertureY.Limits]';
            
            if app.DetectorCoordinateSystem.Value == "Cartesian"
                xyui = (virtual_aperture_center - transmitted_beam_center)*scale;
            else % "Polar"
                xyui = virtual_aperture_center - transmitted_beam_center;
                [theta, rho] = cart2pol(xyui(1), xyui(2));
                xyui = [rho*scale, rad2deg(theta)];
            end
            
            % Limit check
            xyui = clip(xyui, xy_limits(1,:), xy_limits(2,:));
            
            set_external_source(app, event, ...
                [app.VirtualApertureR; ...
                app.VirtualApertureRSpinner; ...
                app.VirtualApertureX; ...
                app.VirtualApertureXSpinner; ...
                app.VirtualApertureY; ...
                app.VirtualApertureYSpinner], ...
                {"Value"}, ...
                {radius; ...
                min(radius*scale, app.common_parameters.max_radius*scale); ...
                xyui(1); ...
                xyui(1); ...
                xyui(2); ...
                xyui(2)})
            
            set_external_source(app, event, ...
                [app.VirtualApertureMirrorRotation; ...
                app.VirtualApertureMirrorRotationSpinner], ...
                "Value", mirror_angle)
            
            % Early return if only updating for coordinate options
            if source == app.DetectorCoordinateSystem
                return;
            end
            
            % Update ROIs
            [theta, rho] = cart2pol(virtual_aperture_center(1) - transmitted_beam_center(1), ...
                virtual_aperture_center(2) - transmitted_beam_center(2));
            
            angles = rad2deg(theta) + (0 : 360/app.VirtualApertureSymmetry.Value : 360*(1-1/app.VirtualApertureSymmetry.Value))';
            virtual_aperture_center_new = rho*[cosd(angles) sind(angles)];
            
            % If mirrored, double the amount of center positions
            if app.VirtualApertureMirror.Value
                R_mirror = rotation_matrix(app, 90 - mirror_angle);
                virtual_aperture_center_new = [virtual_aperture_center_new; virtual_aperture_center_new*R_mirror.*[-1 1]*(R_mirror')];
            end
            
            % Relative -> Absolute
            virtual_aperture_center_new = virtual_aperture_center_new + transmitted_beam_center;
            set(app.annotations.VrAp, ...
                {"Center"}, num2cell(virtual_aperture_center_new,2), ...
                'Radius', radius)
            
            % Update mirror line ROIs, whether visible or not, deal
            % with any Infs by clipping to [-1e9, 1e9]
            pos = [[1;app.dataset_parameters.n_pixels(1)], tand(mirror_angle)*([1;app.dataset_parameters.n_pixels(1)] - transmitted_beam_center(1)) + transmitted_beam_center(2)];
            pos = clip(pos,-1e9,1e9);
            app.annotations.VrApMirL.Position = pos;
            
            [x,y] = pol2cart(deg2rad(mirror_angle), sqrt(sum((app.annotations.VrApMirP.Position - transmitted_beam_center).^2)));
            
            % Restrict point within plot
            xy_point = [x y] + transmitted_beam_center;
            xy_point(xy_point > num_pix) = num_pix(xy_point > num_pix);
            xy_point(xy_point < 1) = 1;
            set_external_source(app, event, app.annotations.VrApMirP, "Position", xy_point)
            
            % Whether to update images
            if to_update_image(app, event)
                % Generate mask
                mask_vr = false(app.dataset_parameters.n_pixels);
                for i = 1:numel(app.annotations.VrAp)
                    mask_vr = mask_vr | createMask(app.annotations.VrAp(i), app.image_displays.Diffraction)';
                end
            
                % Invert mask?
                if app.VirtualApertureInvert.Value
                    mask_vr = 1 - mask_vr;
                end
            
                app.images.DiffractionMask = mask_vr;
                app.images.Real = gather(reshape(reshape(mask_vr,1,[])*app.data, app.dataset_parameters.n_frames));
                plot_all_patterns(app, event)
            end
        end

        function auto_align(app)
            % Auto-align transmitted beam
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % display a progress dialog
            app.tmp_variables.progress_dialog = progress_dialog(app, 'Finding transmitted beam ...', "Auto Alignment");

            % Align transmitted beam by trying to find the transmitted
            % disk in the diffraction pattern (app.images.Diffraction),
            % apply slight Gaussian blur of 5 pixels to help the fit if
            % necessary
            try
                warning("off");
                [trans_beam_center, trans_beam_radius, ~] = imfindcircles(app.images.Diffraction*(-1)^app.DispColorMapInvert.Value, [1 round(max(app.dataset_parameters.n_pixels)/2)]);
                if isempty(trans_beam_center)
                    [trans_beam_center, trans_beam_radius, ~] = imfindcircles(imgaussfilt(app.images.Diffraction*(-1)^app.DispColorMapInvert.Value,5), [1 round(max(app.dataset_parameters.n_pixels)/2)]);
                end
                warning("on");
            catch
                trans_beam_center = [];
                trans_beam_radius = [];
            end
            trans_beam_center = fliplr(trans_beam_center);

            % Close the progress bar
            delete(app.tmp_variables.progress_dialog);

            % Store old transmitted beam values
            transBeam_old = [app.center app.TransBeamR.Value];

            % Find circle closest to the center of the diffraction
            % pattern, plot for user confirmation
            if isempty(trans_beam_center)
                notification_dialog(app, ...
                    "warn", ...
                    "No transmitted beam detected. Please align the transmitted beam manually.", ...
                    "Auto-align Failed");
                selection = "No. Revert";
            else
                % Assign radius and center value(s) found above using
                % imfindcircles based on whichever is found to be
                % closest to the diffraction pattern center
                % `app.common_parameters.diffraction_center`
                [~,im] = min(sqrt(sum((trans_beam_center-app.common_parameters.diffraction_center).^2,2)));
                app.TransBeamX.Value = trans_beam_center(im,1);
                app.TransBeamY.Value = trans_beam_center(im,2);
                app.TransBeamR.Value = trans_beam_radius(im);

                % To update annotation/panel values
                transmitted_beam_callbacks(app,struct("Source", "", "EventName", ""));

                % don't ask the user for feedback on the initial run of
                % autoAlign(app)
                if app.common_parameters.transmitted_beam_init
                    selection = notification_dialog(app,'quest', "Is the auto-alignment correct?",'Auto-align',["Yes", "No. Revert"]);
                else
                    selection = "Yes";
                end
            end

            % Revert alignment if not correctly detected
            if selection == "No. Revert"
                app.TransBeamX.Value = transBeam_old(1);
                app.TransBeamY.Value = transBeam_old(2);
                app.TransBeamR.Value = transBeam_old(3);
            end
        end

        function cross_align(app)
            % Function to align the transmitted beam to the intersection of two lines
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % draw two line annotations
            app.annotations.line1 = drawline("Parent", app.image_axes.Diffraction, ...
                                             "Position", app.dataset_parameters.n_pixels.*[1 1;3 3]/4, ...
                                             "Color", "r", ...
                                             "Deletable",false);

            app.annotations.line2 = drawline("Parent", app.image_axes.Diffraction, ...
                                             "Position", app.dataset_parameters.n_pixels.*[1 3;3 1]/4, ...
                                             "Color", "r", ...
                                             "Deletable",false);

            % add listeners to the annotations
            addlistener(app.annotations.line1, "ROIMoved", @find_intersection);
            addlistener(app.annotations.line1, "MovingROI", @find_intersection);
            addlistener(app.annotations.line2, "ROIMoved", @find_intersection);
            addlistener(app.annotations.line2, "MovingROI", @find_intersection);

            % initialize transmitted beam to the intersection point of the two
            % line annotations
            find_intersection()

            % Wait for the user to confirm before finishing
            h = helpdlg('Push OK when finished');
            h.Units = 'pixels';
            h.Position(1:2) = app.Quant4D_Fig.Position(1:2) + [0, (app.Quant4D_Fig.Position(4) - h.Position(4))/2];
            enable_windows(app, false)
            app.figures.Diffraction.UserData.grayout.Visible = false;
            app.SettingsPanel.Enable = true;
            uiwait(h);
            enable_windows(app, true)

            % clear line annotations
            delete(app.annotations.line1)
            delete(app.annotations.line2)

            function find_intersection(~,~)
                % Internal function to find the intersection point of two lines
                % and set the transmitted beam location accordingly.
                %
                % Parameters:
                %    source (images.roi.Line): line annotation (unused)
                %    event: even Class (unused)
                %
                % Returns:
                %    None

                % get point-pairs
                x1 = app.annotations.line1.Position(1,1);
                x2 = app.annotations.line1.Position(2,1);
                x3 = app.annotations.line2.Position(1,1);
                x4 = app.annotations.line2.Position(2,1);

                y1 = app.annotations.line1.Position(1,2);
                y2 = app.annotations.line1.Position(2,2);
                y3 = app.annotations.line2.Position(1,2);
                y4 = app.annotations.line2.Position(2,2);

                % get intersection from 4 point-pairs
                app.center = [x1*y2-x2*y1, x3*y4-x4*y3] / ...
                                [   y2-y1,  y4-y3;
                                -(x2-x1),-(x4-x3)];

                % send values to transmitted beam UI elements
                app.TransBeamX.Value = app.center(1);
                app.TransBeamXSpinner.Value = app.center(1);
                app.TransBeamY.Value = app.center(2);
                app.TransBeamYSpinner.Value = app.center(2);

                % update global center
                app.annotations.TransBeam.Center = app.center;

            end
        end

        function move_transmitted_beam(app, source, event)
            % Function to sync UIs/ROIs depending on the central beam location
            %
            % Parameters:
            %    app (Quant4D)
            %    source (images.roi.Circle) : transmitted beam annotation
            %    event (event.EventData) : ROIMoved, MovingROI
            %
            % Returns:
            %    None

            trans_beam_center = [app.TransBeamX.Value, app.TransBeamY.Value];
            radius = app.TransBeamR.Value;
            alpha = app.Alpha.Value;
            mrad_per_px = alpha/radius;
            n_pixels = app.dataset_parameters.n_pixels;

            if isempty(findobj(app.image_axes.Diffraction, "Tag","TransBeamAnnot"))
                app.annotations.TransBeam = []; % If ROI is not plotted
            else
                switch event.Source
                    case {app.TransBeamX, app.TransBeamXSpinner}
                        % Force X >= 1
                        trans_beam_center(1) = max(1, event.Value);

                    case {app.TransBeamY, app.TransBeamYSpinner}
                        % Force Y >= 1
                        trans_beam_center(2) = max(1, event.Value);

                    case {app.TransBeamR, app.TransBeamRSpinner}
                        % Radius
                        radius = event.Value;

                    case app.Alpha
                        % Calculate the diffraction scale
                        alpha = event.Value;

                    case app.mradPx
                        % Manually set the diffraction scale
                        mrad_per_px = event.Value;
                        alpha = mrad_per_px*radius;

                    case app.annotations.TransBeam
                        % ROI
                        trans_beam_center = source.Center;
                        radius = source.Radius;
                end
                if event.Source ~= app.mradPx
                    mrad_per_px = alpha/radius;
                end
            end

            % Restrict transmitted beam location/size
            %center(center > n_pixels) = n_pixels(center > n_pixels);
            %center(center < 1) = 1;
            trans_beam_center = clip(trans_beam_center, 1, n_pixels);
            app.center = trans_beam_center;

            % Find the max allowed radius to the furthest corner from `center`
            app.common_parameters.max_radius = ceil(sqrt(sum((abs(app.common_parameters.diffraction_center-trans_beam_center) + app.common_parameters.diffraction_center -1).^2)));

            % make sure r is not larger than the max radius; cannot be
            % 0 so clip to eps
            radius = clip(radius, eps, app.common_parameters.max_radius);

            % Update UI limits
            set([app.TransBeamR, ...
                app.TransBeamRSpinner], ...
                "Limits", ...
                [eps(), app.common_parameters.max_radius])

            set([app.InnerAnnularRadius, ...
                app.OuterAnnularRadius, ...
                app.VirtualApertureR], ...
                "Limits", ...
                [0, app.common_parameters.max_radius])

            % Update UI values
            set_external_source(app, ...
                event, ...
                [app.TransBeamR; ...
                app.TransBeamX; ...
                app.TransBeamY; ...
                app.TransBeamRSpinner; ...
                app.TransBeamXSpinner; ...
                app.TransBeamYSpinner; ...
                app.Alpha; ...
                app.mradPx], ...
                {"Value"}, ...
                {radius; ...
                trans_beam_center(1); ...
                trans_beam_center(2); ...
                radius; ...
                trans_beam_center(1); ...
                trans_beam_center(2); ...
                alpha; ...
                mrad_per_px})

            % set the annular integration step size based on max radius
            % (convert to mrad for the UI); default to stepping each
            % pixel, with a max of 250 steps, otherwise pre-calculation
            % of the annular images can get quite slow
            if event.Source ~= app.AnnularStep
                app.AnnularStep.Value = app.mradPx.Value * max(1, app.common_parameters.max_radius/250);
            end

            % Update ROI
            set(app.annotations.TransBeam,"Center",trans_beam_center,'Radius',radius)

            % Update global coordinate properties
            detector_coordinates_callbacks(app, event)

        end

        function notes = get_import_info(app)
            % Function to update current dataset import parameters
            %
            % Parameters:
            %   app (Quant4D)
            %
            % Returns:
            %    notes (str) : collection of import parameters for display to the user

            params = app.dataset_parameters;
            previous_params = app.tmp_variables.prev_D;

            % create a notes string with important info
            notes = "File: " + replace(params.file_path, "\", "\\");

            % include sub-image if applicable
            if ~isempty(params.subimage)
                notes = notes + "\nSub-dataset: " + params.subimage;
            end

            notes = notes ...
                    + "\n\n" ...
                    + "# Current Data Info #\n" ...
                    + "Byte Order: " + app.sys_constants.endian_text.(params.byte_orer) + "\n"...
                    + "Data Type: " + params.data_type + "\n"...
                    + "Byte Size: " + app.byte_size.(params.data_type) + " bytes\n" ...
                    + sprintf("Diffraction size (X×Y): %d×%d\n",params.n_pixels) ...
                    + sprintf("Real-spaces size (X×Y): %d×%d\n\n",params.n_frames) ...
                    + "# Data Structure in File #\n" ...
                    + "Data Offset: " + previous_params.offset + " bytes\n" ...
                    + "Data Header: " + previous_params.header + "bytes\n" ...
                    + "Data Footer: " + previous_params.footer + " bytes\n" ...
                    + "Byte Order: " + app.sys_constants.endian_text.(previous_params.byte_orer) + "\n"...
                    + "Data Type: "+ previous_params.data_type + "\n"...
                    + "Byte Size: " + app.byte_size.(previous_params.data_type) + " bytes" ...
                    + "\n\n" ...
                    + "# File Meta Info Notes #\n" ...
                    + strjoin(previous_params.file_metadata,'\n') ...
                    + "\n\n" ...
                    + "# Import Option Notes #\n" ...
                    + strjoin(previous_params.import_options,'\n');

            notes = sprintf(notes);
        end

        function err = export_data(app, event)
            % Function to export data as `.h5` or `.raw`
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    err (int | bool) : error code, default: false, -1 if an error has occurred

            err = false;

            % export full file name with directory path
            app.tmp_variables.efile = fullfile(app.SaveDirectoryPath.Value, app.ExportFilename.Value+"."+app.ExportDataType.Value);

            % notify user and exit if the file already exists
            if isfile(app.tmp_variables.efile)
                notification_dialog(app, "warn", "File: '"+app.tmp_variables.efile+"' already exists!",'File Exists!');
                return
            end

            % Update export range
            [pixels_dist, pixels_start, n_pixels, pixels_end, frames_dist, frames_start, n_frames] = update_export_range(app, event);

            % Local variables
            data_type = app.dataset_parameters.data_type;
            frame_size = n_pixels(1) * n_pixels(2) * app.dataset_parameters.byte_size;
            byte_order = app.ExportByteOrder.Value;

            % Progress window with per-second-updating `timer`
            [app.tmp_variables.progress_dialog, app.tmp_variables.tmr] = import_export_progress(app, "Export", n_frames(1)*n_frames(2), frame_size);

            % Make dataset 4D
            app.data = reshape(app.data, [app.dataset_parameters.n_pixels, app.dataset_parameters.n_frames]);

            if app.ExportDataType.Value == "h5"
                % Sort out the h5 data type string; e.g. H5T_IEEE_F32LE, H5T_IEEE_F32BE, H5T_IEEE_F64LE, H5T_IEEE_F64BE
                h5dt = "H5T_IEEE_F" + app.byte_size.(data_type)*8 + upper(byte_order) + "E";

                % C-like array indices for H5 low-level APIs
                file_id = H5F.create(app.tmp_variables.efile);
                type_id = H5T.copy(h5dt);
                file_space_id = H5S.create_simple(4, [n_frames(2), n_frames(1), n_pixels(2), n_pixels(1)], []);
                memory_space_id = H5S.create_simple(2, [n_pixels(2), n_pixels(1)], []);
                property_list = H5P.create('H5P_DATASET_CREATE');
                H5P.set_chunk(property_list, [1, 1, n_pixels(2), n_pixels(1)]);
                dataset_id = H5D.create(file_id, '/STEM4D', type_id, file_space_id, property_list);

                % Whole data in one go
                %         H5D.write(dset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL','H5P_DEFAULT', ...
                %           data(pixels_start(1):pixels_end(1), pixels_start(2):pixels_end(2), frames_start(1):frames_end(1), frames_start(2):frames_end(2)));

                % One frame at a time
                for frame_y = 0 : n_frames(2) - 1
                    for frame_x = 0 : n_frames(1) - 1
                        % Break when progress windows closed
                        if ~isvalid(app.tmp_variables.progress_dialog)
                            err = -1;
                            break;
                        end

                        % Update processed Frame Number for progress update
                        app.tmp_variables.frame_number(1) = frame_y*n_frames(1) + frame_x + 1;
                        H5S.select_hyperslab(file_space_id, 'H5S_SELECT_SET', [frame_y, frame_x, 0, 0], [], [], [1, 1, n_pixels(2), n_pixels(1)]);

                        % Selected frame
                        frame = gather(app.data(pixels_start(1):pixels_end(1), ...
                            pixels_start(2):pixels_end(2), ...
                            frames_start(1)+frame_x*frames_dist, ...
                            frames_start(2)+frame_y*frames_dist));

                        % Pixel Binning
                        if pixels_dist > 1
                            frame = squeeze(sum(reshape(frame, [pixels_dist, n_pixels(1), pixels_dist, n_pixels(2)]), [1 3],'omitnan'));
                        end

                        H5D.write(dataset_id, 'H5ML_DEFAULT', memory_space_id, file_space_id, 'H5P_DEFAULT', frame);
                    end

                    if err == -1
                        break;
                    end
                end

                % Close created handles
                H5D.close(dataset_id);
                H5S.close(memory_space_id);
                H5S.close(file_space_id);
                H5T.close(type_id);
                H5P.close(property_list);
                H5F.close(file_id);

            elseif app.ExportDataType.Value == "raw"
                file_id = fopen(app.tmp_variables.efile,"w");
                % One frame at a time
                for frame_y = 0 : n_frames(2)-1
                    for frame_x = 0 : n_frames(1)-1
                        % Break when progress windows closed
                        if ~isvalid(app.tmp_variables.progress_dialog)
                            err = -1;
                            break;
                        end

                        % Update processed Frame # for progress update
                        app.tmp_variables.frame_number(1) = frame_y*n_frames(1) + frame_x + 1;

                        % Selected frame
                        frame = gather(app.data(pixels_start(1):pixels_end(1), pixels_start(2):pixels_end(2), frames_start(1)+frame_x*frames_dist, frames_start(2)+frame_y*frames_dist));

                        % Pixel binning
                        if pixels_dist > 1
                            frame = squeeze(sum(reshape(frame, [pixels_dist, n_pixels(1), pixels_dist, n_pixels(2)]), [1 3],'omitnan'));
                        end

                        fwrite(file_id, frame, data_type, byte_order);
                    end
                    if err == -1
                        break;
                    end
                end

                fclose(file_id);
            end

            % Close progress window
            delete(app.tmp_variables.progress_dialog);

            % Make dataset 2D again
            app.data = reshape(app.data, prod(app.dataset_parameters.n_pixels), []);

            if err
                app.tmp_variables.progress_dialog = progress_dialog(app, "Deleting the canceled export file ...", "Export Canceled");

                % Delete created file, if export canceled
                delete(app.tmp_variables.efile);
                delete(app.tmp_variables.progress_dialog)
            else
                notification_dialog(app, "help", "Export to '"+app.tmp_variables.efile+"' finished!",'Export Finished!');
            end

            enable_windows(app, true)
        end

        function [pixels_dist, pixels_start, n_pixels, pixels_end, frames_dist, frames_start, n_frames] = update_export_range(app, event)
            % Save images based on the user selections on the Save/Export UI
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    pixels_dist (int) : binning distance in diffraction space
            %    pixels_start ([int int]) : starting pixel index in diffraction space (default: 1, unless cropping)
            %    n_pixels ([int int]) : number of pixels to be exported in diffraction space
            %    pixels_end ([int int]) :final pixel index in diffraction space (default: n_pixels, unless cropping)
            %    frames_dist (int) : sub-sampling distance in real space
            %    frames_start ([int int]) : starting frame index in real space (default: 1, unless sub-sampling)
            %    n_frames ([int int]) : number of frames to be exported in real space

            % initialize parameters
            diffraction_event = event;
            real_event = event;

            % Update Diffraction and Real-space export ranges; use dummy event if source is not a range UI
            if ~contains(event.Source.Tag, "Diffraction")
                diffraction_event = struct("Source", app.DiffractionPartialExportPixelsDist, ...
                    "Value", app.DiffractionPartialExportPixelsDist.Value);
            end

            if ~contains(event.Source.Tag, "Real")
                real_event = struct("Source", app.RealPartialExportFramesDist, ...
                    "Value", app.RealPartialExportFramesDist.Value);
            end

            %notes, binning, xy_start, n_points, xy_end
            [diffraction_note, pixels_dist, pixels_start, n_pixels, pixels_end] = range_import_export(app, diffraction_event);
            [real_note, frames_dist, frames_start, n_frames,  ~] = range_import_export(app, real_event);

            % Add dimension suffix and Remove old suffix
            app.ExportFilename.Value = regexprep(app.ExportFilename.Value, '_\d*x\d*x\d*x\d*$', "");
            if app.ExportDimensionSuffix.Value
                app.ExportFilename.Value = sprintf('%s_%dx%dx%dx%d', app.ExportFilename.Value, n_pixels, n_frames);
            end

            % Export summary notes
            filenote = sprintf("Directory: '%s'\nFilename: '%s.%s'", app.SaveDirectoryPath.Value, app.ExportFilename.Value, app.ExportDataType.Value);

            if app.ExportDataType.Value == "h5"
                filenote = filenote + sprintf("\nDataset: '/STEM4D'");
            end

            notes = diffraction_note + real_note ...
                + "\nData Type: " + app.dataset_parameters.data_type + " (was " + app.tmp_variables.prev_D.data_type + " in original file)" ...
                + "\nByte Order: " + app.sys_constants.endian_text.(app.ExportByteOrder.Value) + " (was " + app.sys_constants.endian_text.(app.tmp_variables.prev_D.byte_orer) + " in original file)" ...
                + "\nSystem Byte Order: " + app.sys_constants.endian_text.(app.sys_constants.system_endianness) ...
                + sprintf('\nEstimated file size: %.3f GiB', prod([n_pixels n_frames])*app.dataset_parameters.byte_size/1024^3) ...
                + sprintf('\nAvailable space: %.3f GiB', quant4d.freeSpace(app.SaveDirectoryPath.Value)/1024^3);

            app.ExportNotes.Value = filenote+sprintf("\n\n"+notes);
        end

        function move_export_annotation(app, ~, event)
            % Update Export Data boundaries as user change the Export Data Annotations
            %
            % Parameters:
            %    app (Quant4D)
            %    source (images.roi.Rectangle) : real-space export annotations, ignored
            %    event (event.EventData)
            %
            % Returns:
            %    None
            
            debug_time = tic;
            export_callbacks(app, event)
            debug_toc(app, event, "", debug_time)
        end

        function update_prefix(app, event)
            % Update image name prefix on the Save/Export UI
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData) 
            %
            % Returns:
            %    None

            if is_static_event(app, event)
                % If not in any annular mode, disable the inner/outer radii prefix
                set([app.SavePrefixAngleInner; ...
                    app.SavePrefixAngleOuter], ...
                    "Enable", ismember(app.Mode.Value,["Annular" "CoM" "DPC"]))

                if ~app.SavePrefixAngleInner.Enable
                    set([app.SavePrefixAngleInner app.SavePrefixAngleOuter], "Value",0);
                end

                % Include inner and outer annular radii
                ang = "";
                inner_radius = "";
                outer_radius = "";
                if app.SavePrefixAngleInner.Value
                    inner_radius = "" + round(app.InnerAnnularRadiusSpinner.Value,2);
                end

                if app.SavePrefixAngleOuter.Value
                    outer_radius = ""+round(app.OuterAnnularRadiusSpinner.Value,2);
                end

                if all([inner_radius outer_radius] ~= "")
                    ang = "-";
                end

                ang = inner_radius + ang + outer_radius;

                if ang ~= ""
                    ang = ang + app.DetectorCoordinateUnit.Value + "_";
                end

                app.SaveImageList.Items = app.SaveImagePrefix.Value + ang + app.SaveImageList.ItemsData;
                if app.Mode.Value == "DPC"
                    app.SaveImageList.Items = replace(app.SaveImageList.Items, "CoM", "DPC");
                end
            end
        end

        function save_images(app)
            % Save images based on the user selections on the Save/Export UI
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % Give the user a progress bar in case it takes some time to save
            app.tmp_variables.progress_dialog = progress_dialog(app, 'Saving image(s) ...', "Image Saving");

            % Save as 32-bit unscaled, uncompressed Tiff images
            tagstruct = struct('PlanarConfiguration',Tiff.PlanarConfiguration.Chunky,'Compression',Tiff.Compression.None, ...
                'SampleFormat',Tiff.SampleFormat.IEEEFP,'Photometric',Tiff.Photometric.MinIsBlack,'BitsPerSample',32);

            for id = reshape(string(app.SaveImageList.Value),1,[])
                imgfile = fullfile(app.SaveDirectoryPath.Value, app.SaveImageList.Items{app.SaveImageList.ItemsData == id});

                if app.SaveImagePNG.Value
                    if app.SaveImageAnnotations.Value
                        print(app.figures.(id), imgfile, '-dpng', "-r"+num2str(app.SaveImageDPI.Value))
                    else
                        imgd = app.image_displays.(id);
                        imwrite(ind2rgb(round(255*imgd.CData)+1,app.image_axes.(id).Colormap).*imgd.AlphaData, [imgfile '.png'])
                    end
                end

                if app.SaveImageTIFF.Value
                    if id == "DiffractionMask" && app.Mode.Value == "DPC"
                        % Save all mask segments into a TIFF stack
                        for j = 1:app.NRung.Value
                            for i = 1:app.NSeg.Value
                                im = uint8(reshape(app.masks.Seg(app.NSeg.Value*(j-1)+i, :), app.dataset_parameters.n_pixels))';
                                imwrite(im, [imgfile '.tif'], 'WriteMode','append');
                            end
                        end
                    elseif id == "DiffractionMask" && app.Mode.Value == "CoM"
                        im = uint8(app.masks.annular)';
                        imwrite(im, [imgfile '.tif']);
                    else
                        % Other images (and "DiffractionMask" from `app.images.DiffractionMask` for other Detector Modes)
                        t = Tiff([imgfile '.tif'], "w");
                        im = app.images.(id)';
                        [tagstruct.ImageLength, tagstruct.ImageWidth] = size(im);
                        tagstruct.SamplesPerPixel = size(im,3);
                        t.setTag(tagstruct);
                        t.write(single(im));
                        t.close();
                    end
                end
            end

            delete(app.tmp_variables.progress_dialog);
        end

        function gpu_note = check_GPU_memory(app, n_pixels, n_frames)
            % Check the amount of GPU memory on the available GPU(s),
            % compare with the estimated memory from `check_memory()` and
            % warn if incompatible.
            %
            % Parameters:
            %    app (Quant4D)
            %    n_pixels ([int int]) : number of pixels in Diffraction space
            %    n_frames ([int int]) : number of probe positions in Real space
            %
            % Returns:
            %    gpu_note (str) : report on memory usage for the user
        
            igpu = app.GPU.Value;
            if ~igpu
                gpu_note = "GPU disabled.";
            elseif prod([n_pixels n_frames]) > intmax("int32")
                gpu_note = "GPU disabled, because dataset has more elements than MATLAB CUDA's maximum (2^31-1).";
                app.GPU.Value = 0;
            else
                tgpu = sprintf('GPU %d. %s %.1f GiB', igpu, app.sys_constants.gpu(igpu).name, app.sys_constants.gpu(igpu).memory/1024^3);
                try
                    if ~parallel.gpu.GPUDevice.getDevice(igpu).DeviceSelected
                        gpuDevice(igpu);
                    end
            
                    available_memory = parallel.gpu.GPUDevice.getDevice(igpu).AvailableMemory;
            
                    % If GPU is already in use, taking the current data size into account
                    if isfield(app.dataset_parameters, "GPU") && app.dataset_parameters.gpu == app.GPU.Value
                        try
                            available_memory = available_memory + app.dataset_parameters.estimated_memory;
                        catch
                        end
                    end
            
                    amem_t = sprintf('%.3f GiB', available_memory/1024^3);
            
                    warning_text = [];
            
                    if app.tmp_variables.estimated_memory > available_memory - 128*1024^2 % Has 128 MiB extra?
                        gpu_note = tgpu+" does NOT have enough free memory ("+amem_t+"). 128 MiB extra free memory required.";
                        warning_text = 'GPU Not Enough Free Memory!';
                        app.GPU.Value = 0;
            
                    elseif app.tmp_variables.estimated_memory > available_memory - 512*1024^2 % Has 512 MiB extra?
                        gpu_note = tgpu+" has LIMITED free memory ("+amem_t+") and may cause errors.";
                        warning_text = 'GPU Limited Free Memory!';
            
                    else
                        gpu_note = tgpu+" has enough free memory ("+amem_t+") for the selected dataset.";
            
                    end
            
                    % Notify warnings if any
                    if ~isempty(warning_text)
                        notification_dialog(app, "warn", gpu_note, warning_text);
                    end
            
                catch ME
                    gpu_note = sprintf('Failed to select %s!\n%s\n%s\n%s',tgpu,ME.identifier,ME.message,ME.Correction);
                    notification_dialog(app, "error", gpu_note, 'Error Selecting GPU!');
                    app.GPU.Value = 0;
                end
            end
        end

        function memory_note = check_memory(app, event, n_pixels, n_frames, bytesize)
            % Check the amount of system memory available, estimate the
            % required memory, compare and warn if incompatible. 
            %
            % Parameters:
            %    app (Quant4D)
            %    n_pixels ([int int]): number of pixels in Diffraction space
            %    n_frames ([int int]): number of probe positions in Real space
            %    bytesize (int): size of the data type in bytes
            %
            % Returns:
            %    memory_note (str) : report on memory usage for the user

            % Display estimated size in green if matches actual size, brown if smaller, red if larger
            if app.tmp_variables.EstSize == app.tmp_variables.FileSize
                app.ImportEstimatedFilesize.FontColor = [0 0.5 0];
            elseif app.tmp_variables.EstSize < app.tmp_variables.FileSize
                app.ImportEstimatedFilesize.FontColor = [0.5 0.5 0];
            else
                app.ImportEstimatedFilesize.FontColor = "r";
            end
            
            % Estimate the amount of memory needed to hold the largest arrays in memory
            % Estimate of the distance to the far corner of the diffraction pattern
            est_mem = prod([n_pixels n_frames]) ...                                   % app.data
                + prod(n_frames)*size(0:0.5:floor(sqrt(sum((n_pixels/2).^2))),2) ...  % app.images.annular_images
                + prod(n_frames)*10 + prod(n_pixels)*2  ...                           % app.images
                + prod(n_pixels)*10;                                                  % app.masks
            
            app.tmp_variables.estimated_memory = est_mem*bytesize;
            
            % check if there is an appropriate GPU to use
            if event.Source ~= app.GPU
                if any([app.sys_constants.gpu.memory]>=app.tmp_variables.estimated_memory)
                    [~,gpu_index] = max([app.sys_constants.gpu.memory]);
                    app.GPU.Value = gpu_index;
                else
                    app.GPU.Value = 0;
                end
            end
            
            memory_note = sprintf("Estimated memory usage: %.3f GiB.",app.tmp_variables.estimated_memory/1024^3);
            if app.tmp_variables.estimated_memory > app.sys_constants.total_memory
                msg = sprintf("WARNING: Size of dataset is larger than the system memory!");
                notification_dialog(app, "error", msg, 'Size Exceeds System Memory!');
                memory_note = memory_note+"\n"+msg;
            end
            memory_note = memory_note+"\nSystem byte order: "+app.sys_constants.endian_text.(app.sys_constants.system_endianness)+".";
        end

        function guess_frames_from_dim3(app, dim3)
            % Guess number of real space frames in X and Y when a dataset is read
            % in as 3D, rather than 4D. 
            %
            % Parameters:
            %    app (Quant4D)
            %    dim3 (int): Total number of real-space frames in a 4D dataset that has been read in as 3D.
            %
            % Returns:
            %    None
        
            scan = quant4d.guessScanShape(dim3);   % rx*ry == dim3, as square as possible
            app.ImportFramesX.Value = scan(1);
            app.ImportFramesY.Value = scan(2);
        end

        function get_dims_from_name(app, filename)
            % Guess dataset size from `filename` if it contains certain
            % regular expressions. Where A, B, C, D are integers. (A,B) = #
            % pixels in Diffraction space. (C,D) = # probe positions in
            % Real space.
            % 
            % Parameters:
            %    app (Quant4D)
            %    filename (str) : 'prefixAxBxCxDbar' or 'scan_xC_yD.raw'
            %
            % Returns:
            %    None

            dims = quant4d.parseDimsFromName(filename);   % [] if no size in the name
            if ~isempty(dims)
                set([app.ImportPixelsX, ...
                     app.ImportPixelsY, ...
                     app.ImportFramesX, ...
                     app.ImportFramesY], ...
                    {"Value"}, ...
                    num2cell(dims)')
            end
        end

        function guess_frames_from_size(app)
            % Make an initial guess at the dataset dimensions assuming a roughly
            % square field of view (ImportFramesX≈ImportFramesY). Sets the
            % estimated values in their respective numeric fields in the Import UI
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            if app.ImportPixelsX.Value > 1 && app.ImportPixelsY.Value > 1
                x = sqrt((app.tmp_variables.FileSize-app.DatasetOffset.Value-app.tmp_variables.fileTail) ...
                    /(app.ImportPixelsX.Value*app.ImportPixelsY.Value*app.byte_size.(app.ImportDataType.Value)+app.DataHeader.Value+app.DataFooter.Value));

                set([app.ImportFramesX, ...
                    app.ImportFramesY], ...
                    "Value",max(floor(x),1))
            end
        end

        function import_data(app, event)
            % Function to prepare for dataset import, read the file, and
            % switch the UI to `Alignment` mode
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None


            debug_time = tic;

            if ~isfile(app.dataset_parameters.file_path)
                notification_dialog(app, "warn", "File: '"+app.dataset_parameters.file_path+"' is not found!",'File Unfound!');
                return
            end

            % Set save/export filenames etc.
            app.SaveDirectoryPath.Value = app.dataset_parameters.file_directory;
            app.SaveImagePrefix.Value = app.dataset_parameters.file_name + "_";
            app.ExportFilename.Value = app.dataset_parameters.file_name + "_export";

            % Start file reading here
            try
                err = read_file(app, event);
            catch ME
                % Kill the reading progress update timer
                try stop(app.tmp_variables.tmr), delete(app.tmp_variables.tmr); catch; end
                try delete(app.tmp_variables.progress_dialog); catch; end
                try unload_data(app); catch; end
                stk = "";
                for i = 1:numel(ME.stack)
                    stk = sprintf("%s\n%s, Line: %d", stk, ME.stack(i).name, ME.stack(i).line);
                end
                notification_dialog(app, ...
                    "error", ...
                    sprintf('%s\n%s\n%s%s', ME.identifier, ME.message, ME.Correction, stk), ...
                    "Error during Import!");
                enable_windows(app,true)
                rethrow(ME)
            end
            % If aborted or errors occurred during file reading, reset app like just opened without import
            if err == -1
                reset_Quant4D(app, event);
                return;
            end

            debug_toc(app, event, "", debug_time)

            % Prepare imported data
            if app.dataset_parameters.keep_parameters
                % Enter alignment mode
                app.Mode.Value = "Alignment";

                % Not re-initializing and just to update all images if "swap data"
                mock_UI_callbacks(app, app.UpdateImages)
                mock_UI_callbacks(app, app.Mode)

                % Swap byte check
                dataset_options_callbacks(app, event)

            else
                prepare_data(app, event)

            end

        end

        function err = read_file(app, event)
            % Function to read the dataset from file
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    err (int | bool) : error code, default: false, -1 if an error has occurred

            debug_time = tic;
            err = false;

            % Use local variables
            ordering = app.ImportAxisOrder.Value;
            offset = app.dataset_parameters.offset;
            header = app.dataset_parameters.header;
            footer = app.dataset_parameters.footer;
            byte_order = app.dataset_parameters.byte_orer;
            dtype = app.dataset_parameters.data_type;
            b_size = app.dataset_parameters.byte_size;
            n_pixels_total = app.dataset_parameters.n_pixels_total;
            pixels_binning = app.dataset_parameters.pixels_binning;
            n_frames_total = app.dataset_parameters.n_frames_total;
            frames_sampling = app.dataset_parameters.frames_sampling;
            pixels_start = app.dataset_parameters.pixels_start;
            n_pixels = app.dataset_parameters.n_pixels;
            frames_start = app.dataset_parameters.frames_start;
            n_frames = app.dataset_parameters.n_frames;

            % convert to single/double if int/uint
            dtype1 = dtype;
            if contains(dtype,'int')
                if b_size > 4
                    dtype1 = "double";
                    b_size1 = 8;
                else
                    dtype1 = "single";
                    b_size1 = 4;
                end
                app.dataset_parameters.data_type = dtype1;
                app.dataset_parameters.byte_size = b_size1;
            end
                
            % Progress window: readHDF5 reports per scan row, readRaw per probe position
            % ("kr" files) or per detector pixel read ("rk" files)
            if ~isempty(app.dataset_parameters.h5ds)
                frame_size = prod(n_pixels)*pixels_binning^2*n_frames(1)*b_size;
                [app.tmp_variables.progress_dialog, app.tmp_variables.tmr] = import_export_progress(app, "Import", n_frames(2), frame_size);
            elseif startsWith(ordering, "kr")
                frame_size = prod(n_pixels)*pixels_binning^2*b_size;
                [app.tmp_variables.progress_dialog, app.tmp_variables.tmr] = import_export_progress(app, "Import", prod(n_frames), frame_size);
            else
                frame_size = prod(n_frames_total)*b_size;
                [app.tmp_variables.progress_dialog, app.tmp_variables.tmr] = import_export_progress(app, "Import", prod(n_pixels*pixels_binning), frame_size);
            end

            if ~isempty(app.dataset_parameters.h5ds) % HDF5 import
                % 4-D (ry, rx, ky, kx) or 3-D (N, ky, kx) datasets; see quant4d.readHDF5
                [data_tmp, cancelled] = quant4d.readHDF5(app.dataset_parameters.file_path, ...
                    app.dataset_parameters.h5ds, ...
                    ScanSize = n_frames_total, ...
                    PixelStart = pixels_start, NumPixels = n_pixels, Binning = pixels_binning, ...
                    FrameStart = frames_start, NumFrames = n_frames, Sampling = frames_sampling, ...
                    Progress = @(done, ~) import_progress(app, done));
                if cancelled
                    err = -1;
                else
                    app.data = reshape(data_tmp, prod(n_pixels), prod(n_frames));
                end

            elseif app.dataset_parameters.memory_type == "Physical Memory"
                % Raw binary in any axis order; sizes and ranges are detector [kx ky] and
                % scan [rx ry] whatever the file order (decision D1). `dtype` is the class
                % stored in the file; readRaw returns single/double. See quant4d.readRaw
                [data_tmp, cancelled] = quant4d.readRaw(app.dataset_parameters.file_path, ...
                    [n_pixels_total n_frames_total], ...
                    Order = ordering, DataType = dtype, ByteOrder = byte_order, ...
                    Offset = offset, Header = header, Footer = footer, ...
                    PixelStart = pixels_start, NumPixels = n_pixels, Binning = pixels_binning, ...
                    FrameStart = frames_start, NumFrames = n_frames, Sampling = frames_sampling, ...
                    Progress = @(done, ~) import_progress(app, done));
                if cancelled
                    err = -1;
                else
                    app.data = reshape(data_tmp, prod(n_pixels), prod(n_frames));
                end

            elseif app.dataset_parameters.memory_type== "Virtual Mapping"
                % Virtual memory mapping

                % Create a memory mapped file, rather than reading the file directly into memory
                if ~strcmp(app.sys_constants.system_endianness, byte_order)
                    error("Dataset's endianness is different to that of the system!")
                end

                if header == 0 && footer == 0
                    app.memfile = memmapfile(app.dataset_parameters.file_path, ...
                        'Offset', offset, ...
                        'Format', {dtype1,[prod(n_pixels), prod(n_frames)],'data'}, ...
                        'Repeat', 1);
                    app.data = app.memfile.Data.data;
                else
                    error("Virtual memory with header/footer > 0 not supported yet.")
                end
            end

            % remove temporary data reference
            clear data_tmp

            % Delete the interruptible progress window
            delete(app.tmp_variables.progress_dialog)

            % Move to GPU if enabled
            if app.dataset_parameters.gpu > 0 && err == 0
                app.tmp_variables.progress_dialog = progress_dialog(app, "Moving dataset to GPU memory ...", "GPU Transfer");
                app.data = gpuArray(app.data);
                delete(app.tmp_variables.progress_dialog)
            end

            % Check data NaN/Inf, without asking to sway byte-order
            selection = check_NaN(app, app.data(:), true);
            if strcmp(selection,'Set NaNs to 0')
                app.data(isnan(app.data(:)))=0;
            end

            debug_toc(app, event, "", debug_time)

        end

        function keep_going = import_progress(app, done)
            % Progress callback for quant4d.readRaw / quant4d.readHDF5: updates the
            % import progress bar and cancels the import when its window is closed
            %
            % Parameters:
            %    app (Quant4D)
            %    done (int) : blocks read so far
            %
            % Returns:
            %    keep_going (bool) : false once the progress window has been closed

            app.tmp_variables.frame_number(1) = done;
            keep_going = isvalid(app.tmp_variables.progress_dialog);
        end

        function prepare_data(app, event)
            % Initialize GUI/Image/app.common_parameters defaults based
            % on the specifics of the imported dataset.
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            app.tmp_variables.progress_dialog = progress_dialog(app, 'Preparing data ...', "Data Preparation");
            
            % center the waitbar in the preview window
            app.tmp_variables.progress_dialog.Units = 'pixels';
            app.tmp_variables.progress_dialog.Position(1) = app.figures.Preview.Position(1) + app.figures.Preview.Position(3)/2 - app.tmp_variables.progress_dialog.Position(3)/2;
            app.tmp_variables.progress_dialog.Position(2) = app.figures.Preview.Position(2) + app.figures.Preview.Position(4)/2 - app.tmp_variables.progress_dialog.Position(4)/2;

            % Detector controls

            % Reset alignments
            app.common_parameters.scan_direction_initialized = false;

            % Prepare to enter alignment mode
            app.Mode.Value = "Alignment";
            app.AnnularRadiusLink.Value = false;

            set([app.NSeg, ...
                app.NRung, ...
                app.DetectorRotationSlider, ...
                app.DetectorRotationSpinner, ...
                app.ScanDirectionSlider, ...
                app.ScanDirectionSpinner], ...
                {"Value"}, ...
                {4; ...
                1; ...
                0; ...
                0; ...
                0; ...
                0})

            set([app.VirtualApertureSymmetry, ...
                app.VirtualApertureInvert, ...
                app.VirtualApertureMirror, ...
                app.VirtualApertureMirrorRotation], ...
                {"Value"}, ...
                {1; ...
                0; ...
                0; ...
                0})

            % Alignments

            % Exact center of the Diffraction image
            app.common_parameters.diffraction_center = app.dataset_parameters.n_pixels/2 + 0.5;

            % Exact center of the Real-space image
            app.common_parameters.real_space_center = app.dataset_parameters.n_frames/2 + 0.5;

            % Convergence angle default = 1
            app.Alpha.Value = 1;

            % Set virtual aperture (x,y) default location to diffraction center
            app.common_parameters.virtual_aperture_center = app.common_parameters.diffraction_center;

            % Axes limits, restrict to avoid rounding to pixels outside the image
            app.common_parameters.diffraction_axes_limit = [0.51, app.dataset_parameters.n_pixels(1) + .49, 0.51, app.dataset_parameters.n_pixels(2) + .49];
            app.common_parameters.real_axes_limit = [0.51, app.dataset_parameters.n_frames(1) + .49, 0.51, app.dataset_parameters.n_frames(2) + .49];
            set(app.ui_groups.diffraction_axes, ...
                "XLim" , app.common_parameters.diffraction_axes_limit(1:2), ...
                "YLim",app.common_parameters.diffraction_axes_limit(3:4));
            set(app.ui_groups.real_axes, ...
                "XLim", app.common_parameters.real_axes_limit(1:2), ...
                "YLim",app.common_parameters.real_axes_limit(3:4));

            % iCoM/dCoM band-pass (decision D2): smallest and largest feature to keep, in
            % scan pixels; [1, larger scan size] = no filtering. See quant4d.periodsToBand
            feature_px = [1 max([2, app.dataset_parameters.n_frames])];
            band_ui = [app.BandpassFilterLow; app.BandpassFilterHigh; app.BandpassFilter];
            set(app.BandpassFilterPanel, "Tooltip", "Keep features between these sizes (scan " + ...
                "pixels). Left: smallest feature kept (removes noise). Right: largest feature " + ...
                "kept (removes slow background). Full range = no filter.")
            app.BandpassFilterLow.ValueDisplayFormat = 'min %d px';
            app.BandpassFilterHigh.ValueDisplayFormat = 'max %d px';
            app.BandpassFilter.MinorTicks = [];
            set(band_ui(1:2), "Value", 1);        % inside both the old and the new limits
            app.BandpassFilter.Value = [1 1];
            set(band_ui, "Limits", feature_px)
            set(band_ui, {"Value"}, {feature_px(1); feature_px(2); feature_px})

            % Transmitted Beam controls
            if event.Source ~= app.SwapRealXY
                % Keep transmitted beam alignment if swapping Real-space X/Y
                app.common_parameters.transmitted_beam_init = false;

                % set transmitted beam radius, x, y limits and values
                set([app.TransBeamR; ...
                    app.TransBeamX; ...
                    app.TransBeamXSpinner; ...
                    app.TransBeamY; ...
                    app.TransBeamYSpinner], ...
                    {"Limits"}, ...
                    {[eps(), max(app.dataset_parameters.n_pixels)]; ...
                    [0, app.dataset_parameters.n_pixels(1)]; ...
                    [0, app.dataset_parameters.n_pixels(1)]; ...
                    [0, app.dataset_parameters.n_pixels(2)]; ...
                    [0, app.dataset_parameters.n_pixels(2)]}, ...
                    {"Value"}, ...
                    {min(app.dataset_parameters.n_pixels)/10; ...
                    app.common_parameters.diffraction_center(1); ...
                    app.common_parameters.diffraction_center(1); ...
                    app.common_parameters.diffraction_center(2); ...
                    app.common_parameters.diffraction_center(2)});

                % Update Transmitted Beam dependent variables
                transmitted_beam_callbacks(app, event)
            end

            % Real-space ROI controls
            set([app.RealROIFrameX; ...
                app.RealROIFrameY], ...
                {"Limits"}, ...
                {[0 app.dataset_parameters.n_frames(1)]; ...
                [0 app.dataset_parameters.n_frames(2)]}, ...
                {"Value"}, ...
                {app.common_parameters.real_space_center(1); ...
                app.common_parameters.real_space_center(2)})
            app.RealROIInvert.Value = false;
            app.RealROIShape.Value = "full";

            % Export controls
            export_callbacks(app, struct("Source", app.ExportPartialPixels, "EventName", [], "Value", 0))
            export_callbacks(app, struct("Source", app.ExportPartialFrames, "EventName", [], "Value", 0))

            % Image display contrasts and vector field
            for ax = app.ui_groups.image_axes'
                ax.UserData.brightness = 50;
                ax.UserData.contrast = 50;
                ax.UserData.gamma = 1;
                ax.UserData.mask_opacity = 0;
                ax.UserData.vector_field = false;
            end

            % Update all images
            mock_UI_callbacks(app, app.UpdateImages)

            % Close progress bar and Enable panel objects
            delete(app.tmp_variables.progress_dialog);

            % Enter initializing alignment
            mock_UI_callbacks(app, app.Mode)
            app.SettingsTabGroup.SelectedTab = app.DisplayTab;

            % Show the brightness/contrast/gamma controls
            figure(app.Quant4D_Fig)
            figure(app.figures.Settings)

            % alert user to the need to calibrate the transmitted beam
            flash_background(app, [app.DiffractionCalibrationGrid app.TransBeamAlignGrid])
        end

        function d = gather_import_options(app, preview)
            % Collects all import parameters from the Import UI into a
            % structure, `d`.
            %
            % Parameters:
            %    app (Quant4D)
            %    preview (bool) : true = Preview mode, false = Import mode
            %
            % Returns:
            %    d (struct) : dataset parameters from Import UI

            % get file location
            d.file_path = app.ImportFilePath.Value;
            [d.file_directory, d.file_name, d.file_extension] = fileparts(d.file_path);
            d.file_directory = strcat(d.file_directory, filesep);
            d.subimage = app.SubDataset.Value;

            % BYTES offset of: 1) the dataset from the beginning of file, 2) before and 3) after each frame
            d.offset = app.DatasetOffset.Value;
            d.header = app.DataHeader.Value;
            d.footer = app.DataFooter.Value;

            % Endianness (big "b" or little "l"), Data type of the dataset and Size in bytes of the data type
            d.byte_orer = app.ImportByteOrder.Value;
            d.data_type = app.ImportDataType.Value;
            d.byte_size = app.byte_size.(d.data_type);

            % Physical or virtual memory loading
            d.memory_type= app.MemoryType.Value;

            % Select GPU if acceleration is enabled AND not in Import Preview Mode
            d.gpu = app.GPU.Value;
            if ~preview && d.gpu
                gpuDevice(d.gpu);
            end

            % Dimensions of pixels/frames in file and import binning/sampling distance
            d.n_pixels_total = [app.ImportPixelsX.Value, app.ImportPixelsY.Value];
            d.n_frames_total = [app.ImportFramesX.Value, app.ImportFramesY.Value];
            d.pixels_binning= app.DiffractionPartialImportPixelsDist.Value;
            d.frames_sampling = app.RealPartialImportFramesDist.Value;

            % Starting points and Number of pixels/frames after binning/sampling to import
            d.pixels_start = [app.DiffractionPartialImportXStart.Value, app.DiffractionPartialImportYStart.Value];
            d.frames_start = [app.RealPartialImportXStart.Value, app.RealPartialImportYStart.Value];
            d.n_pixels = [app.DiffractionPartialImportX.Value, app.DiffractionPartialImportY.Value];
            d.n_frames = [app.RealPartialImportX.Value, app.RealPartialImportY.Value];

            % Estimated memory usage for current dataset
            d.estimated_memory = app.tmp_variables.estimated_memory;

            % Swap dataset option+app.ImportSummary.Value;
            d.keep_parameters = app.SwapDataset.Value;

            % Notes at import
            d.file_metadata = app.ImportFileMetadata.Value;
            d.import_options = app.ImportSummary.Value;

            % H5 dataset path within the H5 file; if not set empty, the H5 library API will be called when importing
            d.h5ds = [];
            if app.HDF5.Value && d.memory_type== "Physical Memory"
                d.h5ds = d.subimage;
            end
        end

        function output = switch_on_off(~, status)
        % Wrapper function for MATLAB's `OnOffSwitchState()`
        %
        % Parameters:
        %    app (Quant4D) : ignored
        %    status (int | bool) : 0 or false = off; 1 or true = on
        %
        % Returns:
        %    output (str) : "on", "off"

            output = string(matlab.lang.OnOffSwitchState(status));
        end

        function set_external_source(app, event, object, varargin)
            % Set properties of objects that are not `source` if it is a changing event
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %    object: UI component, annotation, list of objects with a common property
            %    varargin : property/value pair(s) (i.e. "Value", 1)
            %
            % Returns:
            %    None

            % Get source
            source = event.Source;

            % If not a changing event, set source as well
            if is_static_event(app, event) || isempty(source)
                source = {[]};
            end

            % Convert source to string if it is a character string
            if ischar(source)
                source = string(source);
            end

            % get index of objects that are NOT source
            object = object(:);
            source_index = object ~= source;

            % set properties and values for each object
            for i = 1:numel(varargin)/2
                prop = varargin{2*i-1};
                val = varargin{2*i};
                
                if iscell(prop) && all(numel(object) == numel(prop))
                    prop = prop(source_index);
                end
                
                if iscell(val) && all(numel(object) == numel(val))
                    val = val(source_index);
                end

                set(object(source_index),prop,val);
            end
        end

        function R = rotation_matrix(~, degrees)
            % Rotation matrix, for degree input
            %
            % Parameters:
            %    app (Quant4D) : ignored
            %    degrees (double) : angle in degrees
            %
            % Returns:
            %    R (array) : 2D rotation matrix

            R = [cosd(degrees), sind(degrees);
                -sind(degrees), cosd(degrees)];
        end

        function status = is_static_event(~, event)
            % Function to test whether an event is NOT "MovingROI" or
            % "ValueChanging"; return `true` for `[]` etc. This helps
            % to reduce computational load, especially on image refresh.
            %
            % Parameters:
            %    app (Quant4D) : ignored
            %    event (event.EventData)
            %
            % Returns:
            %    status (bool) : true if `event` is static; else false

            status = isempty(event) || ...
                     ~(isfield(event,"EventName") || ...
                     isprop(event,"EventName")) || ...
                     isempty(event.EventName) || ...
                     ~ismember(event.EventName, ["MovingROI" "ValueChanging"]);
        end

        function h = h5_datasets(~,file)
            % Return all h5 Datasets with some key info
            %
            % Parameters:
            %    app (Quant4D) : ignored
            %    file (str) : file path from app.ImportFilePath.Value
            %
            % Returns:
            %    h (struct) : h5 Dataset information, including Name, Dataspace, Datatype, offset, size, byte_ordering, and type.

            h5_info = h5info(file);
            h = struct("Name", {}, ...
                       "Dataspace", {}, ...
                       "Datatype", {}, ...
                       "offset", {}, ...
                       "size", {}, ...
                       "byte_order", {}, ...
                       "type", {});

            get_groups(h5_info);
            type_details();

            % End of main function
            function get_groups(g)
                for i = 1:length(g)
                    datasets(g(i).Name, g(i).Datasets);
                    get_groups(g(i).Groups);
                end
            end

            function datasets(p, d)
                if p(end) ~= '/'
                    p(end + 1) = '/';
                end

                for i = 1:length(d)
                    h(end + 1).Name = strcat(p, d(i).Name); %#ok<*AGROW>
                    h(end).Dataspace = d(i).Dataspace;
                    h(end).Datatype = d(i).Datatype;
                end
            end

            function type_details()
                fid = H5F.open(file);
                for j = 1:length(h)
                    dset_id = H5D.open(fid, h(j).Name);
                    h(j).size = H5D.get_storage_size(dset_id);
                    try
                        h(j).offset = H5D.get_offset(dset_id);
                    catch
                        h(j).offset = -1;
                    end

                    type_id = H5D.get_type(dset_id);

                    byte_order = H5T.get_order(type_id);
                    % Byte order
                    switch byte_order
                        case 0
                            h(j).byte_order = 'H5T_ORDER_LE';
                        case 1
                            h(j).byte_order = 'H5T_ORDER_BE';
                        case 2
                            h(j).byte_order = 'H5T_ORDER_VAX';
                        case 3
                            % Not yet exists in MatLab
                            h(j).byte_order = 'H5T_ORDER_MIXED';
                        case 4
                            h(j).byte_order = 'H5T_ORDER_NONE';
                        case (-1)
                            h(j).byte_order = 'H5T_ORDER_ERROR';
                    end

                    data_type = h(j).Datatype;
                    switch data_type.Class
                        case 'H5T_FLOAT'
                            if data_type.Size == 4
                                h(j).type = "single";
                            elseif data_type.Size == 8
                                h(j).type = "double";
                            end

                        case 'H5T_INTEGER'
                            h(j).type = sprintf('int%d', data_type.Size * 8);
                            if ~H5T.get_sign(type_id)
                                h(j).type = strcat('u', h(j).type);
                            end
                    end
                    H5T.close(type_id);
                    H5D.close(dset_id);
                end
                h(end + 1).Name = '/';
                h(end).offset = 0;
                h(end).size = H5F.get_filesize(fid);
                H5F.close(fid);
            end
        end

        function debug_toc(app, event, notes, tic_start)
            % Function to debug and time functions
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %    notes (str) : debugging information
            %    tic_start (uint64) : stopwatch timer start
            %
            % Returns:
            %    None

            if app.debug
                source_name = "";
                event_name = "";

                if ~isempty(event)
                    % Find name of the source field_name` by comparing the source with fieldnames of `app`
                    if (isfield(event, "Source") || isprop(event, "Source")) && ~isempty(event.Source)
                        field_name = fieldnames(app);
                        for i = 1:length(field_name)
                            if ~isa(app.(field_name{i}), 'gpuArray') && isequal(app.(field_name{i}), event.Source)
                                source_name = field_name{i};
                                break;
                            end
                        end
                    end

                    % Get EventName
                    if (isfield(event, "EventName") || ...
                        isprop(event, "EventName")) && ...
                        ~isempty(event.EventName)
                        event_name = event.EventName;
                    end
                end

                % caller(2).name`: caller of the function on dbstack
                caller = dbstack;

                % print debug notes to Command Window
                fprintf('%s, %s, %s, %s: %.3f s\n', caller(2).name, source_name, event_name, notes, toc(tic_start));
            end
        end

        function flash_background(~, target)
            % Function to flash the background of UIs, which have
            % `BackgroundColor`. This process will pause the whole
            % program during flashing
            %
            % Parameters:
            %    app (Quant4D) : ignored
            %    target : UI component
            %
            % Returns:
            %    None

            % Input `target` can be arrays of multiple UIs;
            % which will flash simultaneously 
            
            % Get original color
            original_color = get(target, "BackgroundColor");

            % Make `original_color` a cell if not already
            if ~iscell(original_color)
                original_color = {original_color};
            end

            % commence flashing between green and `orignal_color` twice
            for i = 1:2
                pause(0.2);
                set(target, "BackgroundColor",'g');
                pause(0.2);
                set(target,{"BackgroundColor"},original_color)
            end
        end

        function change_icon_background(app, source)
            % state button background color change to highlight when it
            % is/isn't enabled
            %
            % Parameters:
            %    app (Quant4D)
            %    source (matlab.ui.control.Button) : UI State Button
            %
            % Returns:
            %    None

            if source.Value
                source.BackgroundColor = app.sys_constants.highlight_color;
            else
                source.BackgroundColor = app.sys_constants.background_color + 0.02;
            end
        end

        function get_GPU(app)
            % Function to get all available GPUs
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % initialize items
            app.GPU.Items = {''};
            app.GPU.ItemsData = 0;
            app.sys_constants.nGPU = -1;

            % Check if parallel computing toolbox is installed for GPU acceleration
            if any(strcmpi("Parallel Computing Toolbox", {ver().Name}))
                try app.sys_constants.nGPU = gpuDeviceCount(); catch; end
            end

            % Find GPU devices and turn on/off GPU support;
            % `app.GPU.Value` == `0` always means "GPU off"
            switch app.sys_constants.nGPU
                case -1
                    app.GPU.Items = {'Parallel Computing Toolbox missing. GPU acceleration disabled.'};
                    app.GPU.Value = 0;
                
                case 0 % no GPU devices
                    app.GPU.Items = {'No GPU found.'};
                    app.GPU.ItemsData = 0;
                    app.GPU.Value = 0;
                
                otherwise % 1 or more devices found
                    maxmem = 0;
                    for i = 1:app.sys_constants.nGPU
                        try
                            tmp = parallel.gpu.GPUDevice.getDevice(i);
                            app.sys_constants.gpu(i).memory = tmp.TotalMemory;
                            app.sys_constants.gpu(i).name = tmp.Name;
                            app.GPU.Items{i} = sprintf('%d. %s %.1f GiB', i, app.sys_constants.gpu(i).name, app.sys_constants.gpu(i).memory/1024^3);
                            app.GPU.ItemsData(i) = i;
                            
                            % Default to GPU with the most memory
                            if app.sys_constants.gpu(i).memory > maxmem
                                maxmem = app.sys_constants.gpu(i).memory;
                                app.GPU.Value = i;
                            end
                        catch
                        end
                    end
                    app.GPU.Items{end + 1} = 'GPU off';
                    app.GPU.ItemsData(end + 1) = 0;
            end
        end

        function get_memory(app)
            % Function to Check usable system memory and make sure the
            % file will fit
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            if ispc
                [~,tmp] = memory;
                app.sys_constants.total_memory = tmp.PhysicalMemory.Total;
                app.sys_constants.free_memory = tmp.PhysicalMemory.Available;

            elseif ismac
                [~,app.sys_constants.total_memory] = system('sysctl -n hw.memsize');
                app.sys_constants.total_memory = str2double(app.sys_constants.total_memory);
                [~,page_memory_size] = system("vm_stat | grep 'page size' | awk '{print $8}'");
                page_memory_size = str2double(page_memory_size);
                [~,wired_memory] = system("vm_stat | grep 'wired' | awk '{print $4}'");
                wired_memory = str2double(wired_memory)*page_memory_size;
                app.sys_constants.free_memory = app.sys_constants.total_memory - wired_memory;
            
            elseif isunix % memory output is in kB => multiply by 1024 for consistency 
                [~,app.sys_constants.total_memory] = system("cat /proc/meminfo | grep MemTotal: | awk '{print $2}'");
                app.sys_constants.total_memory = str2double(app.sys_constants.total_memory)*1024; 
                [~,app.sys_constants.free_memory] = system("cat /proc/meminfo | grep MemAvailable: | awk '{print $2}'");
                app.sys_constants.free_memory = str2double(app.sys_constants.free_memory)*1024;
            end
        end

        % *********************** UI components ***********************
        % Import/export binning/sampling distances:
        %   app.DiffractionPartialImportPixelsDist
        %   app.RealPartialImportFramesDist
        %   app.DiffractionPartialExportPixelsDist
        %   app.RealPartialExportFramesDist
        %
        % DATASET DIMENSIONS IN FILE ON DISK:
        %   app.ImportPixelsX
        %   app.ImportPixelsY
        %   app.ImportFramesX
        %   app.ImportFramesY
        %
        % IMPORT/EXPORT DIMENSIONS (AFTER BINNING/SAMPLING/CROPPING):
        %   app.DiffractionPartialImportX
        %   app.DiffractionPartialImportY
        %   app.RealPartialImportX
        %   app.RealPartialImportY
        %   app.DiffractionPartialExportX
        %   app.DiffractionPartialExportY
        %   app.RealPartialExportX
        %   app.RealPartialExportY
        %
        % IMPORT/EXPORT START POSITIONS (CROPPING):
        %   app.DiffractionPartialImportXStart
        %   app.DiffractionPartialImportYStart
        %   app.RealPartialImportXStart
        %   app.RealPartialImportYStart
        %   app.DiffractionPartialExportXStart
        %   app.DiffractionPartialExportYStart
        %   app.RealPartialExportXStart
        %   app.RealPartialExportYStart
        %
        %
        % ******************** app.dataset parameters *********************
        %
        % DATASET DIMENSIONS IN FILE ON DISK:
        %   app.dataset_parameters.n_pixels_total
        %   app.dataset_parameters.n_frames_total
        %
        % IMPORT DIMENSIONS (AFTER BINNING/SAMPLING/CROPPING):
        %   app.dataset_parameters.n_pixels
        %   app.dataset_parameters.n_frames
        %
        % IMPORT START POSITIONS (CROPPING):
        %   app.dataset_parameters.pixels_start
        %   app.dataset_parameters.frames_start
        function [notes, binning, xy_start, n_points, xy_end] = range_import_export(app, event)
            % Function to calculate import/export range for pixels/frames
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    notes (str) : Diffraction or Real space-dependent notes on import range and binning
            %    binning (int) : binning distance in Diffraction, sub-sampling distance in Real
            %    xy_start ([int int]) : starting pixels or frames in x,y
            %    n_points ([int int]) : number of pixels or frames in x,y
            %    xy_end ([int int]) : ending pixels or frames in x,y

            source = event.Source;
            
            % `uispinner` upper/lower limits must be different, so now set lower limit `0` but force minimum to `1`
            if isfield(event, "Value") || isprop(event, "Value")
                value = max(event.Value, 1);
            end
           
            % Round positions from ROIs
            if isprop(event,'CurrentPosition')
                position = round(event.CurrentPosition);
            end

            % `space`/`unit`: "Diffraction"/"Pixels" OR "Real"/"Frames"
            if contains(source.Tag, "Diffraction")
                space = "Diffraction";
                unit = "Pixels";
            else
                space = "Real";
                unit = "Frames";
            end

            % `action`: "Import" or "Export"
            if contains(source.Tag, "Import")
                action = "Import";
                % Raw dataset dimensions, e.g. app.ImportPixelsX.Value
                data_size = [app.(action+unit+"X").Value, app.(action+unit+"Y").Value];
            else
                action = "Export";
                % Loaded dataset dimensions
                data_size = app.dataset_parameters.("n_"+lower(unit));
            end

            % Binning/Sampling (app.DiffractionPartialImportPixelsDist, app.DiffractionPartialExportPixelsDist, app.RealPartialImportFramesDist or app.RealPartialExportFramesDist)
            binning = app.(space+"Partial"+action+unit+"Dist").Value;
            
            % Get values from UI
            switch source.Tag
                case "Export Diffraction ROI" % From Export Diffraction ROIs
                    xy_start = position(1:2);
                    n_points = max(floor((position(3:4)+1)/binning), 1);
                
                case "Export Real ROI" % From Export Real-space ROIs
                    xy_start = position(1:2);
                    n_points = floor(position(3:4)/binning)+1;
                
                otherwise % From other sources
                    % app.DiffractionPartialImportXStart, app.RealPartialExportXStart etc, (X/Y)Start UIs
                    xy_start = [app.(space+"Partial"+action+"XStart").Value app.(space+"Partial"+action+"YStart").Value];
                    
                    % app.DiffractionPartialImportX, app.RealPartialExportX etc, n_points X & Y UIs
                    n_points = [app.(space+"Partial"+action+"X").Value app.(space+"Partial"+action+"Y").Value];
            end
            
            % Replace value with current event value
            switch source
                case app.(space+"Partial"+action+unit+"Dist")
                    % Binning/Sampling UI
                    binning = value;
                
                case app.(space+"Partial"+action+"XStart")
                    % XStart UI
                    xy_start(1) = value;
                
                case app.(space+"Partial"+action+"YStart")
                    % YStart UI
                    xy_start(2) = value;
                
                case app.(space+"Partial"+action+"X")
                    % n_points X UI
                    n_points(1) = value;
                
                case app.(space+"Partial"+action+"Y")
                    % n_points Y UI
                    n_points(2) = value;
                
                case {app.("Import"+unit+"X") app.("Import"+unit+"Y") app.(action+"Partial"+unit)}
                    % Reset range options if dataset raw dimension changes OR partial selection enables/disables
                    % Update binning/sampling UI limits
                    app.(space+"Partial"+action+unit+"Dist").Limits(2) = min(data_size);
                    
                    % Update preview frame limits
                    if action == "Import" && unit == "Frames"
                        set([app.PreviewFrameX, app.PreviewFrameY], ...
                            {"Limits"}, ...
                            {[0 data_size(1)];[0 data_size(2)]}, ...
                            {"Value"}, ...
                            {data_size(1);data_size(2)});
                    end
                    binning = 1;
                    xy_start = [1 1];
                    n_points = data_size;
            end

            % In general, n_points are determined by (X/Y)Start and Binning/Sampling, unless n_points are the source
            % Whether n_points X or Y are not the source
            source_index = [app.(space+"Partial"+action+"X") app.(space+"Partial"+action+"Y")] ~= source;
            if unit == "Pixels"
                % Determine n_points X/Y if not source
                n_points(source_index) = max(1, min(n_points(source_index), ...
                                             floor((data_size(source_index)-xy_start(source_index)+1)/binning)));
                xy_start = min(xy_start, data_size-n_points*binning+1);
                
                % Endpoints of Pixel ranges
                xy_end = xy_start + (n_points-1 ) * binning;

                % Upper limits of Pixel (X/Y)Start and n_points X & Y
                xy_start_limit = data_size - binning + 1;
                n_points_limit = floor(data_size/binning);
                
                % Positions for Export ROI
                position = [xy_start, n_points*binning-1];

                notes = "Diffraction Range (in pixels [px])";
                unit_abbreviation = " px";
                binning_text = "binning to ";

            else % "Frames"
                % Frame sampling has slightly different logic to pixel binning
                n_points(source_index) = min(n_points(source_index), ...
                                             floor((data_size(source_index) - xy_start(source_index))/binning) + 1);
                
                % Endpoints of Frame ranges
                xy_start = min(xy_start, data_size - (n_points-1)*binning);
                xy_end = xy_start + (n_points - 1)*binning;
                
                % Upper limits of Frame (X/Y)Start and n_points X & Y
                xy_start_limit = data_size;
                n_points_limit = floor((data_size-1)/binning)+1;
                
                % Positions for Export ROI
                position = [xy_start (n_points-1)*binning];
                
                notes = "Real-space Range (in frames [fr])";
                unit_abbreviation = " fr";
                binning_text = "sampling ";
            end

            % Set (X/Y)Start, n_points X & Y and Binning/Sampling UIs
            set([app.(space+"Partial"+action+"XStart"); ...
                 app.(space+"Partial"+action+"YStart"); ...
                 app.(space+"Partial"+action+"X"); ...
                 app.(space+"Partial"+action+"Y"); ...
                 app.(space+"Partial"+action+unit+"Dist")], ...
                {"Limits"}, ...
                num2cell([xy_start_limit n_points_limit min(data_size)]'.*[0, 1] + [1, 0], 2), ...
                {"Value"}, ...
                num2cell([xy_start n_points binning]'))

            % Try to update Export ROIs
            if action == "Export"
                set(findobj(app.ui_groups.(lower(space)+"_axes"), "Tag", "Export "+space+" ROI"), "Position", position)
            end
            
            points_text = n_points + unit_abbreviation;
            
            % If any binning/sampling add text explaining the change in
            % number of points
            if binning > 1
                points_text = binning_text + points_text + " from " + ...
                     (xy_end - xy_start + 1) + unit_abbreviation;
            end
            
            % If not from 1st to last pixel/frame
            source_index = xy_start > 1 | xy_end < data_size;
            points_text(source_index) = n_points(source_index) + unit_abbreviation + ...
                               ", " + (xy_start(source_index)-1) + "/" + ...
                               (data_size(source_index)-xy_end(source_index)) + ...
                               unit_abbreviation + " offset from start/end";

            % Range notes
            notes = sprintf("%s:\n  X = %s–%s (%s)\n  Y = %s–%s (%s)\n", notes, ["" + xy_start; "" + xy_end; points_text]);
        end

        function [wait_bar, tmr] = import_export_progress(app, process, n_frames, frame_size)
            % Function for progress bar of data import/export, with a `timer()` to update its progress per second
            %
            % Parameters:
            %    app (Quant4D)
            %    process (str) : "Import", "Export"
            %    n_frames (int) : total number of Real space frames (i.e. rx*ry)
            %    frame_size (int) : frame size in bytes
            %
            % Returns:
            %    wait_bar (matlab.ui.Figure) : waitbar to display progress
            %    tmr (timer) : 1 Hz timer to update progress bar information (i.e. import rate)


            % `process` will be 'Import'/'Export', and used for texts like "Import/Export" + "ing/ed"
            wait_bar = progress_dialog(app, sprintf("\n%sing ...\n",process), "Data "+process, true);
            
            % center the waitbar in the preview window
            wait_bar.Units = 'pixels';
            wait_bar.Position(1) = app.figures.Preview.Position(1) + app.figures.Preview.Position(3)/2 - wait_bar.Position(3)/2;
            wait_bar.Position(2) = app.figures.Preview.Position(2) + app.figures.Preview.Position(4)/2 - wait_bar.Position(4)/2;

            % Total time and global variable for processed frames of
            % [this second, last second]
            total_time = tic;
            app.tmp_variables.frame_number = [0 0];
            
            % `timer()` to run the sub function per second
            tmr = timer("TimerFcn", @(~,~)update_waitbar(app, wait_bar), ...
                        "ExecutionMode", "fixedDelay", ...
                        "Name", process);
            
            % Start the timer now
            tmr.start();
            
            % Kill the timer when progress windows closes
            wait_bar.DeleteFcn = {@(~,~,t) kill_timer(app,t), tmr};

            function update_waitbar(app, wait_bar)
                % Update progress per second

                % Current  and previous frame number
                current_frame = app.tmp_variables.frame_number(1);
                previous_frame = app.tmp_variables.frame_number(2);

                % Estimate remaining time based on fraction of frames
                % processed since timer executes @ 1 Hz
                if current_frame == previous_frame
                    remaining_time = 0;
                else
                    remaining_time = (n_frames - current_frame) / ...
                                     (current_frame - previous_frame);
                end

                % update waitbar
                waitbar(current_frame/n_frames, ...
                        wait_bar, ...
                        sprintf("%sed frames: %d/%d\nSpeed: %.2f MiB/s\nElapsed: %s \t|\t Remaining: %s", ...
                                process, current_frame, n_frames, (current_frame - previous_frame) * frame_size/1024^2, ...
                                duration(seconds(floor(toc(total_time))),'Format','mm:ss'), ...
                                duration(floor(seconds(remaining_time)),'Format','mm:ss') ...
                                )...
                         );
                
                % move current frame number to previous frame number slot
                app.tmp_variables.frame_number(2) = current_frame;
            end

            function kill_timer(app, tmr)
                % Function to kill the timer and keep windows disabled when
                % progress windows is closed

                stop(tmr);
                delete(tmr);
                app.enable_windows(false)
            end
        end

        function mask = import_mask(app, space)
            % Function to import mask for given (diffraction/real) space
            %
            % Parameters:
            %    app (Quant4D)
            %    space (str) : "Real", "Diffraction"
            %
            % Returns:
            %    mask (array) : array imported by user to mask Real or Diffraction space


            % get `data_size` from `space`: "n_pixels" or "n_frames"
            if space == "Real"
                space_name = "Real-space";
                data_size = app.dataset_parameters.n_frames;
            else % "Diffraction"
                space_name = "Diffraction";
                data_size = app.dataset_parameters.n_pixels;
            end

            mask = [];
            message = "";
            file_types = '*.tif;*.tiff;*.png;*.jpg;*.jpeg;*.bmp;*.gif';
            
            % open file selection UI
            [file,fpath] = uigetfile({file_types, ['Supported Types (' file_types ')']; ...
                                      '*.*','All Files (*.*)'}, ...
                                      sprintf("Select a mask image with shape [%d,%d]",data_size), ...
                                      "MultiSelect", "off");
            
            % get file extension
            try
                [~,~,extension] = fileparts(file);
            catch
                extension = "";
            end
            
            % force lowercase
            switch lower(extension)
                case {'.tif';'.tiff';'.png';'.jpg';'.jpeg';'.bmp';'.gif'}
                    % permute mask, `imread()` transposes images implicitly
                    mask = permute(imread([fpath,file]), [2 1 3]);
                    
                    % Check size/orientation
                    mask_size = size(mask, [1 2]);
                    
                    % If dimension mismatch
                    if ~isequal(mask_size, data_size)
                        % If dimension transposed
                        if isequal(mask_size, flip(data_size))
                            mask = permute(mask, [2 1 3]);
                            message = message + ...
                                sprintf("Image size [%d,%d] transposed to fit data's %s size [%d,%d].\n", mask_size, space_name, data_size);
                        else
                            notification_dialog(app, "warn", sprintf("Image size [%d,%d] does not fit data's %s size [%d,%d]!", ...
                                mask_size, space_name, data_size),"Dimension Mismatch");
                            return
                        end
                    end
                    % Convert to double
                    mask = double(mask);
                
                case ""
                    % Canceled, etc. -> return now
                    return
                
                otherwise
                    notification_dialog(app, "warn", "File type '*"+extension+"' currently not supported!", "Import Failed");
                    return
            end

            % check for NaNs and Infs, set any to 0
            if any(isnan(mask(:)) | isinf(mask(:)))
                mask(isnan(mask) | isinf(mask)) = 0;
                message = message + "NaN/Inf found in image, and set to 0.\n";
            end

            % Convert RGB to gray scale
            if size(mask,3) > 1
                mask = rgb2gray(mask);
                message = message + "Converted from RGB to grayscale.\n";
            end

            % Try to scale the maximum to 1
            mask_max = max(mask(:));
            if mask_max ~= 0 && mask_max ~= 1
                mask = mask/mask_max;
                message = message+"The maximum was "+mask_max+"; now scaled to 1, by `IMG = IMG/"+mask_max+"`.\n";
            end

            % Notification
            if message ~= ""
                message = "Please note:\n"+message+"\n";
            end
            notification_dialog(app, "help", sprintf(message+"Please check the "+space_name+" Mask image."),'Mask Imported');
            figure(app.figures.(space+"Mask"))
        end

        function plot_all_patterns(app, event)
            % Wrapper function for (re)plotting all images
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            % Update images if visible OR not in changing event;
            % include CoMs if in the modes
            for id = app.ui_groups.image_id(contains(app.ui_groups.image_type, ["Primary";"Mask"]) | ...
                                            (ismember(app.Mode.Value, ["CoM" "DPC"]) & ...
                                             app.ui_groups.image_type == "CoM" & ...
                                             app.ui_groups.image_id ~= "ColorWheel"))'
                
                if is_static_event(app, event) || app.figures.(id).Visible
                    plot_image(app, event, id)
                end

            end

            debug_toc(app, event, "", debug_time)
        end

        function plot_image(app, event, id)
            % Generic function for plotting an image on a given axis with brightness/contrast/gamma values
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %    id (str) : image identification string
            %
            % Returns:
            %    None

            % Special case for plotting the color wheel
            if id == "ColorWheel"
                plot_colorwheel();
            end

            % get axis and user_data
            ax = app.image_axes.(id);
            user_data = ax.UserData;

            % clear old `image` on `ax`
            delete(findobj(ax, "Tag", "Image "+user_data.space+" "+user_data.type));
            
            % Abort if image not yet ready
            if ~isfield(app.images, id) || isempty(app.images.(id)) %|| isempty(app.masks)
                if isequal(id, app.DisplayImage.Value)
                    app.ImageStatistics.Value = ax.UserData.name;
                end
                return;
            end

            % Raw array is column-major; transposed to row-major `im`
            im = app.images.(id)';

            % special case for color mixing custom masks
            if strcmp(app.Mode.Value, "Custom") && strcmp(app.CustomDetectorInterMask.Value, "Color Mix")
                % otherwise take over the image with a color mix
                switch id
                    case "Real"
                        % Zeros if no masks yet
                        if ~isfield(app.masks,'CustomColorMix')
                            im = zeros(app.dataset_parameters.n_frames, app.dataset_parameters.data_type);
                        else
                            im = app.images.RealColorMix;
                        end
                    case "DiffractionMask"
                        % Zeros if no masks yet
                        if ~isfield(app.masks,'CustomColorMix')
                            im = zeros(app.dataset_parameters.n_pixels, app.dataset_parameters.data_type);
                        else
                            im = app.masks.CustomColorMix;
                        end
                end
            end

            % Put usable values in `image_stats` for statistics
            image_stats = im(~(isnan(im) | isinf(im)));

            % Make `image_stats` NaN if no usable values
            if isempty(image_stats)
                image_stats = NaN();
            end

            % Find maximum/minimum/range
            [image_min, image_max] = bounds(image_stats(:));
            image_range = image_max - image_min;
            
            % Brightness between -0.5 and 0.5; Contrast between -Inf and 0.5
            image_brightness = (user_data.brightness-50)/100;
            image_contrast = log2(max(realmin(), user_data.contrast/50))/2; % Avoid log2(0)
            
            % Display limits from brightness/contrast; have the same magnitude to the raw image `im`
            image_low = image_min - (image_brightness - image_contrast)*image_range;
            image_high = image_max - (image_brightness + image_contrast)*image_range;
            
            % Normalize image, and apply display thresholds; `im_norm` is always between 0 and 1
            if image_high == image_low && (image_high <= 1 || image_high >= 0)
                % If display limits are both 1 or 0, then no rescale (e.g. `im` is all 1 or 0)
                im_norm = im;

            elseif image_high > image_low || (image_high == image_low && (image_high > 1 || image_high < 0))
                % Normal case for upper limit > lower limit, just apply the limits than rescale
                im_norm = rescale(im, "InputMin", image_low, "InputMax", image_high);
            
            else
                % Display limits are too close or identical, then make
                % `im_norm` binary; If limits are NaN, make them 0.5
                im_norm = (image_high + image_low)/2;
                im_norm(isnan(im_norm)) = 0.5;
                image_high = im_norm;
                image_low = im_norm;
                im_norm = double(im > im_norm);
            end
            
            % Plot the row-major array as row-major `image` and apply gamma
            im_display = imagesc(ax, ...
                                 im_norm.^user_data.gamma, ...
                                 "Tag", "Image "+user_data.space+" "+user_data.type);
            
            % Plot the background, which zooms with the image, for images that rely on `AlphaData` shading
            background = fill(ax, ...
                              [0.5 ax.XLim(2) ax.XLim(2) 0.5], ...
                              [0.5 0.5 ax.YLim(2) ax.YLim(2)], ...
                              "k", ...
                              "Tag", "Image "+user_data.space+" "+user_data.type);

            % Plot mask opacity on non-mask/non-preview image
            if ~ismember(user_data.type, ["Mask" "Preview"])
                mask = app.images.(user_data.space+"Mask")';
                im_display.AlphaData = (1-user_data.mask_opacity/100)*(1-logical(mask))+logical(mask);
            end
            
            % Shade CoM/DPC Phase with Magnitude
            if id == "CoMPhMag"
                im_display.AlphaData = im_display.AlphaData.*app.images.CoMMagNorm';
            end
            
            % Move the `image` to the bottom level of the axis children
            ax.Children = [setdiff(ax.Children,[im_display; background],'stable'); im_display; background];
            
            % Assign the `im_display` `background` to global handles
            app.image_displays.(id) = im_display;
            app.image_displays.(id+"Background") = background;

            % Plot vector field, if selected
            plot_vector_field();
            
            % Only update statistics if not in changing Event AND it is the "selected" image
            if isequal(id, app.DisplayImage.Value) && is_static_event(app, event)
                update_display_image_stats();
            end

            %%% Sub functions
            % Function to update image statistics
            function update_display_image_stats()
                debug_time = tic;
                
                % Get Histogram axis
                hist_ax = app.HistogramAxes;

                % Update histogram; skip if image unchanged
                if is_different_to_previous(app, 'image_stats', image_stats)
                    
                    % Warn if NaNs/Infs are present
                    if numel(im) ~= numel(image_stats)
                        nanwarn = "Contains NaN/Inf";
                    else
                        nanwarn = "";
                    end

                    % Update ImageStatistics display panel text
                    app.ImageStatistics.Value = ...
                        sprintf('min:% -14.7g std:% -14.7g\nmax:% -14.7g sum:% -14.7g\navg:% -14.7g %s', ...
                        image_min, std(image_stats,0, "all"), image_max, sum(image_stats, "all",'omitnan'), mean(image_stats, "all"), nanwarn);

                    % Delete any previous histogram
                    delete(findobj(hist_ax, "Tag", "HistBars"))

                    % Generate an intensity histogram for the selected image
                    h = histogram(hist_ax, ...
                                  image_stats, ...
                                  128, ...
                                  "FaceColor", "r", ...
                                  "Tag", "HistBars");

                    % Set histogram plot limits
                    if image_max > image_min
                        hist_ax.XLim = [image_min image_max] + [-1 1]*0.02*image_range;
                    else
                        hist_ax.XLim = [-Inf Inf];
                    end
                    
                    % Make sure upper limit is at least 1
                    hist_ax.YLim = [0.5 max([h.BinCounts*1.1, 1])];
                end

                % Update histogram annotations; skip if values unchanged
                if is_different_to_previous(app, 'hist', {ax image_max image_min image_range image_high image_low user_data.gamma app.HistogramLog.Value})
                    % Update ROIs
                    % Draw ROI of range if not yet
                    if isempty(findobj(hist_ax, "Tag", "HistROI"))
                        app.annotations.hist.Box = drawrectangle(hist_ax, ...
                                                                 "Position", [1 1 1 1], ...
                                                                 "LineWidth", 1, ...
                                                                 "MarkerSize", eps(), ...
                                                                 "FaceAlpha", 0.1, ...
                                                                 "InteractionsAllowed", "translate");

                        app.annotations.hist.Hi = drawpoint(hist_ax, "Position",[1 1]);
                        app.annotations.hist.Lo = drawpoint(hist_ax, "Position",[1 1]);
                        
                        % add listeners
                        addlistener([app.annotations.hist.Box, ...
                                     app.annotations.hist.Lo, ...
                                     app.annotations.hist.Hi], ...
                                    "MovingROI", @move_histogram_high_low);
                        user_data.Move = addlistener([app.annotations.hist.Box, ...
                                                      app.annotations.hist.Lo, ...
                                                      app.annotations.hist.Hi], ...
                                                     "ROIMoved", @move_histogram_high_low);
                        
                        % set parameters
                        set([app.annotations.hist.Box, ...
                             app.annotations.hist.Lo, ...
                             app.annotations.hist.Hi], ...
                            "Deletable", false, ...
                            "UserData", user_data, ...
                            "Tag", "HistROI")
                    end

                    % Save current display limits to ROIs
                    app.annotations.hist.Box.UserData = {ax image_max image_min image_range image_high image_low};

                    % Update ROIs if not called from them
                    if ~ismember(event.Source, [app.annotations.hist.Box app.annotations.hist.Lo app.annotations.hist.Hi])
                        move_histogram_high_low(event.Source, event);
                    end

                    % Update other annotations
                    delete(findobj(hist_ax, "Tag", "HistAnnot"))
                    
                    % Gamma line
                    x = linspace(image_low,image_high,100);
                    y = ((x-image_low)/(image_high-image_low)).^user_data.gamma.*range(hist_ax.YLim) + hist_ax.YLim(1);
                    app.annotations.hist.gamCrv = plot(hist_ax, ...
                                                       x, y, ...
                                                       "Color", "k", ...
                                                       "Tag", "HistAnnot");
                    
                    % Print display limits on the histogram
                    app.annotations.hist.note = text(hist_ax, ...
                                                     0.02, 0.96, ...
                                                     sprintf('Hi:% -.3g\nLo:% -.3g', image_high, image_low), ...
                                                     "VerticalAlignment", "top", ...
                                                     "BackgroundColor", "w", ...
                                                     "Units", "normalized", ...
                                                     "FontName", "FixedWidth", ...
                                                     "FontWeight", "bold", ...
                                                     "FontSize", 11, ...
                                                     "Tag", "HistAnnot");
                    app.annotations.hist.note.BackgroundColor(4) = 0.7;
                end

                debug_toc(app, event, "", debug_time)

                % Sub function for ROI update
                function move_histogram_high_low(source, event)
                    if isprop(event,'CurrentPosition')
                        position = event.CurrentPosition;
                    end
                    
                    % Get preset values
                    hist_annotation = app.annotations.hist;
                    hist_ax = app.HistogramAxes;
                    [i_ax, i_max, i_min, i_range, i_hi, i_lo] = deal(hist_annotation.Box.UserData{:});
                    y_lim = hist_ax.YLim;

                    switch source
                        case hist_annotation.Box
                            i_lo = position(1);
                            i_hi = position(1) + position(3);

                        case hist_annotation.Lo
                            i_lo = position(1);

                        case hist_annotation.Hi
                            i_hi = position(1);
                    end
                    
                    % Sort out upper/lower limits
                    i_hi = max(i_lo,i_hi);
                    i_lo = min(i_lo,i_hi);
                    
                    % Find mid-height of the histogram, log- or linear-scale
                    if app.HistogramLog.Value
                        ymid = sqrt(prod(y_lim));
                    else
                        ymid = mean(y_lim);
                    end
                    
                    % Update ROI
                    set([hist_annotation.Box, ...
                         hist_annotation.Hi, ...
                         hist_annotation.Lo], ...
                        {"Position"}, ...
                        {[i_lo, y_lim(1), i_hi-i_lo, y_lim(2)-y_lim(1)]; ...
                         [i_hi ymid]; ...
                         [i_lo ymid]})
                    
                    % Limit ROI translating area
                    drawing_area = [hist_ax.XLim(1), ymid, range(hist_ax.XLim), 0];
                    
                    if any(isinf(drawing_area))
                        drawing_area = "auto";
                    end

                    set([hist_annotation.Box, ...
                         hist_annotation.Hi, ...
                         hist_annotation.Lo], ...
                        "DrawingArea", drawing_area, ...
                        "Visible", app.DisplayContrast.Enable)
                    
                    % Update UI and image if called from ROIs
                    if ismember(source,[hist_annotation.Box, hist_annotation.Hi, hist_annotation.Lo])
                        i_ax.UserData.brightness = clip(double(50+(i_max+i_min-i_hi-i_lo)/2/i_range*100),0,100);
                        i_ax.UserData.contrast = clip(double(2^((i_max-i_min-i_hi+i_lo)/2/i_range*2)*50),0,100);
                        display_callbacks(app, event);
                    end
                end
            end

            % Function to plot a vector field image over top of the DPC or CoM images (either magnitude, angle, or combination)
            function plot_vector_field()
                delete(findobj(ax, "Tag", "VectorField"))
                vec = user_data.vector_field;
                
                if ~vec || ~ismember(app.Mode.Value, ["CoM", "DPC"])
                    return;
                end
                
                % Plot vector arrows over the selected image
                app.annotations.vector_field.(id) = quiver(ax, ...
                                                           1:vec:app.dataset_parameters.n_frames(1), ...    % x location
                                                           1:vec:app.dataset_parameters.n_frames(2), ...    % y location
                                                           app.images.CoMX(1:vec:end, 1:vec:end)'./vec, ... % u component
                                                           app.images.CoMY(1:vec:end, 1:vec:end)'./vec, ... % v component
                                                           1, ...                                           % scale
                                                           "Color", user_data.vector_color, ...
                                                           "LineWidth", 1.5, ...
                                                           "Tag", "VectorField");
            end

            % Function to plot color wheel
            function plot_colorwheel()
                % clear the axis
                cla(app.image_axes.ColorWheel)
                
                % Make ColorWheel for DPC/CoM imaging - this color
                % scheme will stay constant for all DPC/CoM images
                % regardless of their individual parameters like scan
                % or detector rotation for consistency
                width = 512; 
                r = width/2;
                
                [ygrid, xgrid] = meshgrid(1 - r : r);
                
                % Get atan() from -180 to 180
                colorwheel = atan2d(ygrid, xgrid);
                
                % shift the negative values of atan() up by 360
                app.images.ColorWheel = (colorwheel) .* (colorwheel >= 0) + ...
                                        (colorwheel + 360) .* (colorwheel < 0);

                % mask the color wheel to make it a circle
                app.images.ColorWheelMask = xgrid.^2 + ygrid.^2 < r^2;
                axis(app.image_axes.ColorWheel,[0, width+1, 0, width+1]);
                app.image_axes.ColorWheel.UserData.mask_opacity = 100;
            end
        end

        function status = is_different_to_previous(app, name, value)
            % Function to check whether the given name value is changed
            % compared to the previous value, and store the new value
            %
            % Parameters:
            %    app (Quant4D)
            %    name (str) : field name in app.previous_values
            %    value : value of app.previous_values.(name) to be tested for update
            %
            % Returns:
            %    status (bool) : Whether app.previous_values.(name) ~= value

            status = ~isfield(app.previous_values, name) || ...
                     ~isequal(app.previous_values.(name), value);
            if status
                app.previous_values.(name) = value;
            end
        end

        function to_update = to_update_image(app, event)
            % Function to determine whether to update images. Return
            % true if any: 1) `app.CalculationPolicy.Value` is 2
            % (active update) OR 2) `app.CalculationPolicy.Value` is 1
            % (reduced) and not when changing OR 3) is a manual update
            % (from update buttons or detector mode change)
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    to_update (bool) : Whether or not image(s) should be updated at the time of calling based on app.CalculationPolicy and current user interactions

            calc = app.CalculationPolicy.Value;
            to_update = calc == 2 || ...
                        (calc && is_static_event(app, event)) || ...
                        event.Source == app.UpdateImages || ...
                        event.Source == app.Mode;
        end

        function mock_UI_callbacks(app, source, value)
            % Function to mock UI callbacks.
            %
            % Parameters:
            %    app (Quant4D)
            %    source : UI elements
            %    value (str) : additional information to be passed along to further function calls
            %
            % Returns:
            %    None

            arguments
                app {mustBeA(app, "Quant4D")}
                source
                value {mustBeText} = "";
            end
            
            % Set value if passed in
            if ~strcmp(value, "")
                source.Value = value;
            end
            
            switch source
                case app.UpdateImages
                    % Update all images
                    update_images(app, struct("Source", source, "EventName", "ButtonPushed"))

                case app.DisplayImage
                    % Update Display UI or Select current image
                    display_callbacks(app, struct("Source", source, "EventName", "ValueChanged"))

                case app.SaveImagePrefix
                    % Update image saving prefix
                    save_callbacks(app, struct("Source", source, "EventName", "ValueChanged"))

                case {app.ShowDiffractionAxes, app.ShowRealAxes}
                    % Update axes annotations
                    axis_direction_callbacks(app, struct("Source", source,"EventName", "ButtonPushed"))

                case app.RealROIShape
                    % Update real-space controls
                    realspace_ROI_callbacks(app, struct("Source", source, "EventName", "ValueChanged"));

                case app.CustomDetectorTable
                    % Update Custom Detectors for Main Table selection change
                    custom_detector_callbacks(app, struct("Source", source,"EventName", "SelectionChanged"))

                case app.CustomDetectorDetailsTable
                    % Mock Custom Detector Detail Table edit to update ROI/images
                    custom_detector_callbacks(app,struct("Source", source, "EventName", "CellEdit"))

                case app.SaveTabGroup
                    % Mock changing Save/Export tabs in Save window
                    export_callbacks(app, struct("Source", source, "EventName", "SelectionChanged"))

                case app.ImportFileSelect
                    % Mock import file select button
                    import_select_file(app,struct("Source", source, "EventName", "ButtonPushed"));

                case app.ShowImportWindow
                    % Mock user clicking "Import" button on main UI
                    import_callbacks(app,struct("Source", source, "EventName", "ButtonPushed"));

                case app.Mode
                    % Mock detector mode changed
                    detector_mode_callbacks(app, struct("Source", source, "EventName", "ValueChanged"));

                case app.PreviewButton
                    % Mock "Import Preview" button
                    preview_callbacks(app, struct("Source", source,"EventName", "ButtonPushed"))

                case app.ShowSaveWindow
                    % Mock user clicking "Save" button on main UI
                    save_callbacks(app, struct("Source", source, "EventName", "ButtonPushed"));
            end
        end

        function selection = notification_dialog(app, icon, msg, title_name, option)
            % Wrapper for notification dialog; use `sprintf()` before calling this function to process "\n" in `message`
            %
            % Parameters:
            %    app (Quant4D)
            %    icon (str) : "quest", "list", "help", "warn", "error", "none", ""
            %    msg (str) : dialog message
            %    title_name (str) : dialog title
            %    option : dialog selection options
            %
            % Returns:
            %    selection (str | int) : user response

            arguments
                app; 
                icon {mustBeText, mustBeMember(icon,{'quest', 'list', 'help', 'warn', 'error', 'none', ''})} = '';
                msg {mustBeText} = "";
                title_name {mustBeText} = "";
                option = ["OK", "Cancel"];
            end

            selection = "";
            
            % Set global default UI font size temporarily
            font_size = 9.5;
            default_font_size = get(0, 'DefaultUIControlFontSize');
            set(0, 'DefaultUIControlFontSize', font_size)
            beep

            switch icon
                case "quest"
                    % `questdlg()` will block all windows and background process
                    if numel(option) > 2
                        selection = questdlg(msg, ...
                                             title_name, ...
                                             option(1), ...
                                             option(2), ...
                                             option(3), ...
                                             option(1));
                    else
                        selection = questdlg(msg, ...
                                             title_name, ...
                                             option(1), ...
                                             option(2), ...
                                             option(1));
                    end
                
                case "list"
                    % `listdlg()` will block all windows and background process
                    selection = listdlg("ListString", option, ...
                                        "SelectionMode", "single", ...
                                        "PromptString", cellstr(split(msg,newline)), ...
                                        "Name", title_name, ...
                                        "ListSize", [300 150]);
                
                case {"help", "warn", "error", "none",""}
                    % The only way to set font size here is Tex; escape
                    % special characters in Tex; Tex is only used for font size
                    msg = "\fontsize{" + font_size + "}" + regexprep(msg, "([\\^_{}])", "\\$1");

                    % Disable windows because `msgbox()` cannot block `uifigure()` windows
                    enable_windows(app,false)
                    f = msgbox(msg, ...
                               title_name, ...
                               icon, ...
                               struct('WindowStyle','modal','Interpreter','tex'));

                    % Enable windows when the notification is gone
                    f.DeleteFcn = {@(~,~) enable_windows(app,true)};

                    % ensure the message is brought to the front
                    figure(f)

                    % Block background process until `msgbox()` is gone
                    uiwait(f)
            end
            
            % Reset global default UI font size
            set(0, "DefaultUIControlFontSize", default_font_size)
        end

        function wait_bar = progress_dialog(app, msg, title_name, interruptible)
            % Wrapper for `waitbar`
            %
            % Parameters:
            %    app (Quant4D)
            %    msg (str) : dialog message
            %    title_name (str) : dialog title
            %    interruptible (bool) : can the dialog be interrupted
            %
            % Returns:
            %    wait_bar (matlab.ui.Figure) – waitbar to display progress
            
            arguments
                app;
                msg {mustBeText} = "";
                title_name {mustBeText} = ""; 
                interruptible (1,1) {mustBeNumericOrLogical} = false;
            end

            % Disable all windows
            enable_windows(app,false)

            % Set mouse cursor to "busy"
            set(app.ui_groups.all_figures, "Pointer", "watch")

            if ~interruptible
                title_name = "(Uninterruptible) "+title_name;
            end

            wait_bar = waitbar(0, ...
                               msg, ...
                               "Name", title_name, ...
                               "WindowStyle", "modal", ...
                               "Visible",false);
            
            % center the waitbar in the diffraction window
            wait_bar.Units = 'pixels';
            wait_bar.Position(1) = app.figures.Diffraction.Position(1) + app.figures.Diffraction.Position(3)/2 - wait_bar.Position(3)/2;
            wait_bar.Position(2) = app.figures.Diffraction.Position(2) + app.figures.Diffraction.Position(4)/2 - wait_bar.Position(4)/2;
            wait_bar.Visible = true;

            % For uninterruptible process:
            if ~interruptible
                % Indeterminate progress bar. "hgjavacomponent" seems to be
                % discontinued in R2025a
                try
                    findall(wait_bar,"type","hgjavacomponent").JavaPeer.setIndeterminate(true);
                catch
                    set(findall(wait_bar,"type","uiprogressindicator"),"Indeterminate",false)
                end
                
                % Disable the close function
                wait_bar.CloseRequestFcn = [];
                
                % Enable windows and reset mouse pointer when the progress windows is gone
                wait_bar.DeleteFcn = @(~,~) enable_windows(app,true);
            end
        end

        function unload_data(app, swap_data)
            % Function to unload data and clean all images; swap_data
            % keeps all previous parameters and simply swaps out data
            %
            % Parameters:
            %    app (Quant4D)
            %    swap_data (bool) : swap dataset (true), unload all data (false)
            %
            % Returns:
            %    None

            arguments
                app
                swap_data (1,:) {mustBeNumericOrLogical} = false;
            end

            % Disable windows for the data unload process
            enable_windows(app,false)

            % reset main UI title
            app.Quant4D_Fig.Name = 'Quant4D';

            % Whether or not to swap dataset only, without changing
            % any existing parameters
            if ~swap_data
                % Clear all Axes
                arrayfun(@(x) cla(x), app.ui_groups.image_axes);
                cla(app.HistogramAxes);
                
                % Clear all parameters, data structures, etc. 
                app.common_parameters = []; 
                app.annotations = [];
                app.images = [];
                app.masks = [];
                app.image_displays = [];
                app.CustomDetectorTable.Data(:,:) = [];
            end

            % Remove all data from GPU if in use
            try
                if app.dataset_parameters.gpu > 0
                    reset(parallel.gpu.GPUDevice.getDevice(app.dataset_parameters.gpu));
                    gpuDevice([]);
                end
            catch
            end

            % Clear data, parameters and Axes
            app.data = [];
            app.memfile = [];
            app.dataset_parameters = [];
            app.previous_values = [];
        end

        function enable_windows(app, state)
            % Function to enable/disable windows/UI; disable is only
            % for notification/progress bar/busy background, etc.
            %
            % Parameters:
            %    app (Quant4D)
            %    state (bool) : enable (true) or disable (false) all windows
            %
            % Returns:
            %    None
            
            arguments
                app
                state (1,1) {mustBeNumericOrLogical} = true;
            end

            % Preview mode or not
            preview_mode = app.Mode.Value == "Preview";

            % Detector Mode UI, keep disabled in Import Preview Mode unless a dataset is loaded
            set(app.ModeGrid.Children, ...
                "Enable", ...
                switch_on_off(app, state && (~preview_mode || ~isempty(app.dataset_parameters))))

            % Real-space ROI controls, keep disabled in Import Preview Mode
            set(app.RealPanel, "Enable",switch_on_off(app, state && ~preview_mode))

            % Other UIs can be enabled in Import Preview Mode
            set([app.ShortcutButtonGrid.Children; ...
                 app.ModePanel; ...
                 app.SettingsPanel; ...
                 app.SavePanel; ...
                 app.ImportPanel], ...
                "Enable", ...
                switch_on_off(app, state))

            % Disable all images when not "on"; visible means disable
            set(app.ui_groups.image_grayout, "Visible", ~state)
            
            % Also reset all windows' mouse pointer when enabling UIs
            if state
                set(app.ui_groups.all_figures,'Pointer','arrow');
            end
        end

        function create_other_windows(app)
            % Function to create other UI windows and Image figures
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None
            
            debug_time = tic;

            % Set window position without using `movegui()`, to avoid its implicit `drawnow`
            title_height = app.sys_constants.title_height;
            decor_width = app.sys_constants.decor_width;
            
            % Available sizes of width/height/left/bottom/right/top
            screen_width = app.sys_constants.screen_avail(3);
            screen_height = app.sys_constants.screen_avail(4);
            screen_left = app.sys_constants.screen_avail(1)+decor_width/2;
            screen_bottom = app.sys_constants.screen_avail(2);
            screen_right = screen_left+screen_width-decor_width;
            screen_top = screen_bottom+screen_height-title_height; % top excluding title bar
            horizontal_center = (screen_left+screen_right)/2;
            vertical_center = (screen_bottom+screen_top)/2;
            image_size = app.Quant4D_Fig.Position(4);

            % Create other UI Windows
            app.figures.Settings = move_UI_to_new_figure('Settings', app.SettingsPanel);
            app.figures.Import = move_UI_to_new_figure('Import Data', app.ImportPanel);
            app.figures.Import.Position(1:2) = ([horizontal_center vertical_center]-app.figures.Import.Position(3:4)/2); % Move to center
            
            % Set `app.Fig.Import` window close as "pushing `app.CancelImport"
            app.figures.Import.CloseRequestFcn = @(~,~)import_callbacks(app, struct("Source", app.CancelImport, "EventName",'ButtonPushed'));
            
            % Move to Save UI to the center
            app.figures.Save = move_UI_to_new_figure('Save/Export', app.SavePanel);
            app.figures.Save.Position(1:2) = ([horizontal_center vertical_center] - app.figures.Save.Position(3:4))/2;
            
            % Set `app.Fig.Save` window close as "pushing `app.SaveCloseButton`"
            app.figures.Save.CloseRequestFcn = @(~,~)export_callbacks(app, struct("Source", app.SaveCloseButton, "EventName",'ButtonPushed'));
            
            % Set main windows `app.Quant4D_Fig` other properties and move to top left
            app.Quant4D_Fig.Position(1:2) = [1, app.sys_constants.screen_size(4) - app.Quant4D_Fig.Position(4) - app.sys_constants.title_height];
            app.Quant4D_Fig.SizeChangedFcn = [];
            app.Quant4D_Fig.KeyPressFcn = @UI_key_press;

            % When delete the main window `app.Quant4D_Fig` (e.g. closing), also delete other windows
            app.Quant4D_Fig.DeleteFcn = {@(~,~,figs) delete(figs), structfun(@(x) x, app.figures)};

            % Move Settings UI next to main window
            app.figures.Settings.Position(1:2) = [sum(app.Quant4D_Fig.Position([1,3]))+1, app.Quant4D_Fig.Position(2)];

            % Set limits/values for image window resize options in settings window
            set([app.SetDiffractionWindowWidth, ...
                 app.SetDiffractionWindowHeight, ...
                 app.SetRealWindowWidth, ...
                 app.SetRealWindowHeight], ...
                {"Limits"}, ...
                {[1 screen_width]; ...
                 [1 screen_height]; ...
                 [1 screen_width]; ...
                 [1 screen_height]}, ...
                "Value", ...
                image_size)

            % Create Image Windows with inputs:
            %   id
            %   title
            %   space (Diffraction/Real/ColorWheel/Preview)
            %   type (Primary/Mask/CoM/Test/Preview)
            %   colormap
            %   position/size

            create_axes_figure("ColorWheel",...
                               "Color Wheel for Phase Direction", ...
                               "ColorWheel", ...
                               "CoM", ...
                               "hsv", ...
                               [horizontal_center 1 200 200]);
            axtoolbar(app.image_axes.ColorWheel, {"datacursor"});

            create_axes_figure("Diffraction", ...
                               "Diffraction", ...
                               "Diffraction", ...
                               "Primary", ...
                               "gray", ...
                               [sum(app.figures.Settings.Position([1,3]))+1 app.Quant4D_Fig.Position(2) image_size image_size]); % next to Settings UI
                              %[horizontal_center-image_size/2 screen_top-image_size image_size image_size]); % Top-center

             % add dropdown to diffraction figure to control how
             % patterns are combined (sum, mean, max, std)
             app.diffraction_dropdown.Parent = app.figures.Diffraction;
             app.diffraction_dropdown.ValueChangedFcn = @app.move_real_ROI;
             app.diffraction_dropdown.Position = [0, app.figures.Diffraction.Position(4) - app.diffraction_dropdown.Position(4), 65, 22];

            create_axes_figure("DiffractionMask", ...
                               "Diffraction Mask", ...
                               "Diffraction", ...
                               "Mask", ...
                               "gray", ...
                               [sum(app.figures.Settings.Position([1,3]))+1 1 image_size image_size]); % Below Diffraction
                               %[horizontal_center-image_size/2 1 image_size image_size]); % Bottom-center

            % Diffraction preview image for import
            create_axes_figure("Preview", ...
                               "Preview", ...
                               "Preview", ...
                               "Preview", ...
                               "gray", ...
                               app.figures.Diffraction.Position);
            
            % Place Real-space images on the right, from top to bottom
            image_left = sum(app.figures.Diffraction.Position([1,3]))+1;
            image_bottom = app.Quant4D_Fig.Position(2);
            image_bottom_offset = image_bottom/8;
            
            ids = ["Real"; "CoMPhMag"; "CoMPh"; "CoMMag"; "CoMX"; "CoMY"; "dCoM"; "iCoM"; "RealMask"];
            titles = ["Real-space"; "CoM Phase (Magnitude-shaded)"; "CoM Phase"; "CoM Magnitude"; "CoM X"; "CoM Y"; "dCoM"; "iCoM"; "Real-space Mask"];
            space = "Real";
            types = ["Primary"; "CoM"; "CoM"; "CoM"; "CoM"; "CoM"; "CoM"; "CoM"; "Mask"];
            cmaps = ["gray"; "hsv"; "hsv"; "gray"; "gray"; "gray"; "gray"; "gray"; "gray"];
            position = [image_left, image_bottom, image_size, image_size];
            
            % Real-space image figures
            for i_figure = 1:numel(ids)
                create_axes_figure(ids(i_figure), ...
                                   titles(i_figure), ...
                                   space, ...
                                   types(i_figure), ...
                                   cmaps(i_figure), ...
                                   position);
                position = position - [0 image_bottom_offset 0 0];
            end

            % Debugging figures
            if app.debug
                create_axes_figure("tDiffraction",...
                                   "Test Diffraction", ...
                                   "Diffraction", ...
                                   "Test", ...
                                   "gray", ...
                                   [horizontal_center - image_size/2, 1, image_size, image_size]); % Bottom-center
                
                create_axes_figure("tReal", ...
                                   "Test BF/DF", ...
                                   "Real", ...
                                   "Test", ...
                                   "gray", ...
                                   [image_left, image_bottom, image_size, image_size]);
            end

            % Variable names, image names and image types (tag) for all patterns'/images' figures/axes/images
            app.ui_groups.image_id = string(fieldnames(app.image_axes));                            % ID/fieldnames under `app.image_axes` `app.figures` `app.images` `app.image_dispays` etc
            app.ui_groups.image_space = string(structfun(@(x) x.UserData.space, app.image_axes));   % Spaces ("Real"/"Diffraction")
            app.ui_groups.image_type = string(structfun(@(x) x.UserData.type, app.image_axes));     % Types ("Primary", "CoM" related, "Mask", "Test")
            app.ui_groups.image_name = string(structfun(@(x) x.UserData.name, app.image_axes));     % Names/Titles
            
            % AND their Axes/Figure objects, as well as the gray overlay to disable them
            app.ui_groups.image_axes = arrayfun(@(x) app.image_axes.(x), app.ui_groups.image_id);
            app.ui_groups.image_figures = arrayfun(@(x) app.figures.(x), app.ui_groups.image_id);
            app.ui_groups.image_grayout = arrayfun(@(x) app.figures.(x).UserData.grayout, app.ui_groups.image_id); % Set them visible to disable the axes
            
            % Variable names for all diffraction-sized figures/axes/images AND THEN their Axes objects
            app.ui_groups.diffraction_id = app.ui_groups.image_id(app.ui_groups.image_space == "Diffraction");
            app.ui_groups.diffraction_axes = arrayfun(@(x) app.image_axes.(x), app.ui_groups.diffraction_id);
            
            % Variable names for all real-space-sized figures/axes/images AND THEN their Axes objects
            app.ui_groups.real_id = app.ui_groups.image_id(app.ui_groups.image_space == "Real");
            app.ui_groups.real_axes = arrayfun(@(x) app.image_axes.(x), app.ui_groups.real_id);

            % set title bar icons
            app.Quant4D_Fig.Icon = reshape(app.sys_constants.background_color,[1,1,3]);
            app.figures.Settings.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'settings.png');
            app.figures.Save.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'save.png');
            app.figures.Import.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'import.png');
            app.figures.ColorWheel.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'colorwheel.png');
            set(arrayfun(@(x) app.figures.(x), app.ui_groups.real_id),'Icon',fullfile(fileparts(mfilename('fullpath')), 'icons', 'image.png'))
            app.figures.Diffraction.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'Diffraction_Pattern.png');
            app.figures.Preview.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'Diffraction_Pattern.png');
            app.figures.DiffractionMask.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'Aperture.png');
            app.figures.RealMask.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'Aperture.png');
            
            % Group all "Show ... Window" buttons related to CoM/DPC
            app.ui_groups.CoM_buttons = [findobj(app.ShowImageWindowsGrid,'-regexp', "Tag",'CoM'); ...
                                         app.ShowColorWheelWindow];
            
            % Group all diffraction detector panels
            app.ui_groups.detector_ui = [app.PreviewGrid; ...
                                         app.AlignmentGrid; ...
                                         app.AnnularDetectorGrid; ...
                                         app.VirtualApertureGrid; ...
                                         app.CustomDetectorGrid];

            % Transfer all detector panels to main window, then delete their old container
            set(flip(app.ui_groups.detector_ui), 'Parent', app.ModePanel);
            delete(app.ModeTabGroup)
            
            % Group all window `figure` `uifigure`
            app.ui_groups.all_figures = [app.Quant4D_Fig; structfun(@(f) f, app.figures)];

            debug_toc(app, [], "", debug_time)


            %%% Sub functions of `otherFigures()`
            % Keyboard shortcuts for main UI windows
            function UI_key_press(~, event)
                debug_time = tic;
                switch event.Key
                    case 'f5'
                        % update with the F5 key
                        if app.UpdateImages.Enable
                            mock_UI_callbacks(app, app.UpdateImages);
                        end
                    case {'o', 'O'}
                        if ismember('control',event.Modifier)
                            mock_UI_callbacks(app, app.ShowImportWindow)
                        end
                    case {'s', 'S'}
                        if ismember('control',event.Modifier)
                            mock_UI_callbacks(app, app.ShowSaveWindow)
                        end
                    case '-'
                        fprintf('minus')
                    case '+'
                        fprintf('plus')
                end
                debug_toc(app, event, "", debug_time)
            end

            % Hide window instead of closing it
            function hide_window(source, ~)
                if isvalid(app)
                    source.Visible = "off";
                else
                    delete(source);
                end
            end

            % Transplant `UI` from its parent to a new separated Figure `ui_figure`
            function ui_figure = move_UI_to_new_figure(name, ui)
                ui_figure = uifigure("Name", name, ...
                                     "Visible", "off", ...
                                     "Position", [1 1 ui.Position(3:4)+2], ...
                                     "AutoResizeChildren", "off", ...
                                     "CloseRequestFcn", @hide_window, ...
                                     "Resize", "off", ...
                                     "KeyPressFcn", @UI_key_press);

                grid_layout = uigridlayout(ui_figure,[1 1],'Padding',[0 0 0 0]);
                ui.Parent = grid_layout;
            end

            % Create Image Window/Axes
            function create_axes_figure(id, name, space, ax_type, color_map, position)
                fig = uifigure("Visible", "off", ...
                               "Name", name, ...
                               "Position", position, ...
                               "MenuBar", "none", ...
                               "NumberTitle", "off", ...
                               "IntegerHandle", "off", ...
                               "Color", app.sys_constants.background_color, ...
                               "WindowButtonDownFcn", @clicked_window, ...
                               "WindowScrollWheelFcn", @scroll_figure, ...
                               "CloseRequestFcn", @hide_window, ...
                               "KeyPressFcn", @figure_key_press, ...
                               "AutoResizeChildren", 'off', ...
                               "SizeChangedFcn", @resize_figure, ...
                               "Tag", space + " " + ax_type);

                % allow for custom axes toolbar
                enableLegacyExplorationModes(fig)

                % An overlay on figure to cover axes; disables the axes when visible
                grayout = annotation(fig, ...
                                     "rectangle", [0 0 1 1], ...
                                     "Visible", "off", ...
                                     "FaceColor", [0.96 0.96 0.96], ...
                                     "FaceAlpha", 0.7);

                % Not `Clipping` axes to let images expand beyond the axes when zooming in
                ax = axes(fig, ...
                          "Color", "k", ...
                          "Colormap", feval(color_map), ...
                          "CLimMode", "manual", ...
                          "Units", "normalized", ...
                          "Position", [0 0 1 1], ...
                          "DataAspectRatio", [1 1 1], ...
                          "XTick", [], ...
                          "YTick", [], ...
                          "XColor", "k", ...
                          "YColor", "k", ...
                          "Box", 1, ...
                          "Clipping", 0, ...
                          "NextPlot", "add", ...
                          "Interactions", [], ...
                          "Tag", space + " " + ax_type);
                
                % Toolbar & its `restoreview()`
                tool_bar = axtoolbar(ax, {"export", "datacursor", "pan", "zoomin", "zoomout", "restoreview"});
                %tool_bar.Children(end).ButtonPushedFcn = @restore_view;
                
                % override `Save as` button to open Save/Export UI
                set(findobj(tool_bar,'Tooltip','Save as'), 'ButtonPushedFcn', @(~,~)app.mock_UI_callbacks(app.ShowSaveWindow))

                % Data Tips
                cursor_mode = datacursormode(fig);
                cursor_mode.UpdateFcn = @show_value;
                set(cursor_mode.UIContextMenu.Children,"Visible", "off")
                
                % Image properties
                if color_map == "gray"
                    vector_color = "r";
                else
                    vector_color = "w";
                end

                ax.UserData = struct("id", id, ...
                                     "name", name, ...
                                     "space", space, ...
                                     "type", ax_type, ...
                                     "colormap", color_map, ...
                                     "invert", false, ...
                                     "mask_opacity", 0, ...
                                     "brightness", 50,...
                                     "contrast", 50,...
                                     "gamma", 1,...
                                     "vector_field", false,...
                                     "vector_color", vector_color);

                fig.UserData = struct("id", id, ...
                                      "name", name, ...
                                      "space", space, ...
                                      "type", ax_type, ...
                                      "grayout", grayout);

                % add references to fig and ax to their respective lists
                app.figures.(id) = fig;
                app.image_axes.(id) = ax;

                % listener for window activation when title bar is clicked
                addlistener(fig, 'FigureActivated', @clicked_window);

                %% Sub sub functions
                % "restoreview" goes back to the limits of the actual image, nothing more/less.
                function restore_view(~, event)
                    axis(event.Axes, app.common_parameters.(lower(event.Axes.UserData.space)+"_axes_limit"))
                    event.Axes.Position = [0 0 1 1];
                    app.diffraction_dropdown.Position = [0, app.figures.Diffraction.Position(4) - app.diffraction_dropdown.Position(4), 65, 22];
                end

                % Modify Data Tips to show the raw value from `app.images.(...)`
                function data_tip = show_value(~, event)
                    x = event.Position(1);
                    y = event.Position(2);
                    value = strtrim(sprintf('%14.7g',app.images.(event.Target.Parent.UserData.id)(x,y)));
                    data_tip = sprintf('Value: \\bf%s\n\\rmX: \\bf%g\\rm, Y: \\bf%g', value, x, y);
                end

                % Select image in Display/contrast panel unless DisplayLock
                % is selected, which leaves the selected window fixed,
                % which is especially useful for watching image statistics
                % change as a detector or ROI moves
                function clicked_window(source, ~)
                    id = string(source.UserData.id);
                    if ~app.DisplayLock.Value && app.DisplayImage.Value ~= id && ismember(id, app.DisplayImage.ItemsData)
                        % The window is already being activated: tell display_callbacks
                        % not to call figure() on it again. With uifigures, figure()
                        % and FigureActivated are asynchronous, so raising the window
                        % here made two windows re-activate each other endlessly.
                        app.tmp_variables.selected_by_activation = true;
                        try
                            mock_UI_callbacks(app, app.DisplayImage, id)
                        catch err
                            app.tmp_variables.selected_by_activation = false;
                            rethrow(err)
                        end
                        app.tmp_variables.selected_by_activation = false;
                    end
                end

                % ensure that the diffraction dropdown stays pinned to the
                % upper left corner of the diffraction figure/axis during
                % resizing
                function resize_figure(source, ~)
                    if source == app.figures.Diffraction
                        app.diffraction_dropdown.Position = [0, app.figures.Diffraction.Position(4) - app.diffraction_dropdown.Position(4), 65, 22];
                    end
                end

                % Keyboard shortcuts for
                function figure_key_press(fig, event)
                    debug_time = tic;
                    
                    % calling figure parameters
                    id = fig.UserData.id;
                    space = fig.UserData.space;
                    ax = app.image_axes.(id);

                    % get axes limits and set step size
                    switch space
                        case {"Diffraction", "Preview"}
                            limits.axes = app.common_parameters.diffraction_axes_limit;
                        case "Real"
                            limits.axes = app.common_parameters.real_axes_limit;
                        case "ColorWheel"
                            return
                    end
                    
                    % set new limits to current limits in case of no change
                    % required
                    limits.x_orig = app.image_axes.(id).XLim;
                    limits.y_orig = app.image_axes.(id).YLim;
                    limits.x_new = limits.x_orig;
                    limits.y_new = limits.y_orig;

                    % get current view width in x and y
                    ranges.x = diff(limits.x_orig);
                    ranges.y = diff(limits.y_orig);
                    
                    % determine axis step size
                    steps.x_fine = 0.05 * diff(limits.axes(1:2));
                    steps.x_coarse = 3 * steps.x_fine;
                    steps.y_fine = 0.05 * diff(limits.axes(3:4));
                    steps.y_coarse = 3 * steps.y_fine;

                    switch event.Key
                        case 'f5'
                            % update with the F5 key
                            if app.UpdateImages.Enable
                                mock_UI_callbacks(app, app.UpdateImages);
                            end

                        case {'s', 'S'}
                            % saving/export shortcuts
                            if ismember('control',event.Modifier)
                                mock_UI_callbacks(app, app.ShowSaveWindow)
                            end

                        case 'subtract'
                            % minus sign for zooming out
                            scroll_figure(fig, struct("VerticalScrollCount", 1));
                            limits.x_new = ax.XLim;
                            limits.y_new = ax.YLim;

                        case 'add'
                            % plus sign for zooming in
                            scroll_figure(fig, struct("VerticalScrollCount", -1));
                            limits.x_new = ax.XLim;
                            limits.y_new = ax.YLim;

                        case 'rightarrow'
                            % right arrow for translating right
                            if limits.x_orig(2) < limits.axes(2)
                                if ismember('control', event.Modifier)
                                    limits.x_new(2) = clip(limits.x_orig(2) + steps.x_coarse, limits.axes(1), limits.axes(2));
                                else
                                    limits.x_new(2) = clip(limits.x_orig(2) + steps.x_fine, limits.axes(1), limits.axes(2));
                                end
                                limits.x_new(1) = limits.x_new(2) - ranges.x;
                            end

                        case 'leftarrow'
                            % left arrow for translating left
                            if limits.x_orig(1) > limits.axes(1)
                                if ismember('control', event.Modifier)
                                    limits.x_new(1) = clip(limits.x_orig(1) - steps.x_coarse, limits.axes(1), limits.axes(2));
                                else
                                    limits.x_new(1) = clip(limits.x_orig(1) - steps.x_fine, limits.axes(1), limits.axes(2));
                                end
                                limits.x_new(2) = limits.x_new(1) + ranges.x;
                            end

                        case 'downarrow'
                            % right arrow for translating right
                            if limits.y_orig(2) < limits.axes(4)
                                if ismember('control', event.Modifier)
                                    limits.y_new(2) = clip(limits.y_orig(2) + steps.y_coarse, limits.axes(3), limits.axes(4));
                                else
                                    limits.y_new(2) = clip(limits.y_orig(2) + steps.y_fine, limits.axes(3), limits.axes(4));
                                end
                                limits.y_new(1) = limits.y_new(2) - ranges.y;
                            end

                        case 'uparrow'
                            % left arrow for translating left
                            if limits.y_orig(1) > limits.axes(3)
                                if ismember('control', event.Modifier)
                                    limits.y_new(1) = clip(limits.y_orig(1) - steps.y_coarse, limits.axes(3), limits.axes(4));
                                else
                                    limits.y_new(1) = clip(limits.y_orig(1) - steps.y_fine, limits.axes(3), limits.axes(4));
                                end
                                limits.y_new(2) = limits.y_new(1) + ranges.y;
                            end

                    end
                    
                    % apply translations
                    ax.XLim = limits.x_new;
                    ax.YLim = limits.y_new;

                    debug_toc(app, event, "", debug_time)
                end

                % function to allow the user to zoom via the mouse scroll
                % wheel without having to click the zoom in/out icons on
                % the axes toolbar; all axes in a given space are linked,
                % so this will carry across to all axes in that space
                function scroll_figure(source, event)
                    zoom_ax = source.CurrentAxes;
                    % zoom in/out by 10% (5% on either side) with each
                    % mouse wheel scroll; VerticalScrollCount == -1 for an
                    % upward scroll and == 1 for a downward scroll
                    zoom_amount = 0.05*[-1 1]*event.VerticalScrollCount;
                    zoom_ax.XLim = zoom_ax.XLim + range(zoom_ax.XLim)*zoom_amount;
                    zoom_ax.YLim = zoom_ax.YLim + range(zoom_ax.YLim)*zoom_amount;

                    % get axis limits for the given space
                    if contains(source.Tag, "Real") || contains(source.Tag, "Preview")
                        lim = app.common_parameters.real_axes_limit;
                    elseif contains(source.Tag, "Diffraction")
                        lim = app.common_parameters.diffraction_axes_limit;
                    end

                    % check limits
                    zoom_range_x = range(zoom_ax.XLim);
                    zoom_range_y = range(zoom_ax.YLim);
                    ax_range_x = diff(lim(1:2));
                    ax_range_y = diff(lim(3:4));

                    % x
                    switch sum(isbetween(zoom_ax.XLim, lim(1), lim(2)))
                        case 0
                            % both limits are out of bounds
                            zoom_ax.XLim = clip(zoom_ax.XLim, lim(1), lim(2));
                        case 1
                            % one limit is out of bounds
                            
                        case 2
                            % all good
                    end

                    % y
                    switch sum(isbetween(zoom_ax.YLim,lim(3),lim(4)))
                        case 0
                            % both limits are out of bounds
                            zoom_ax.YLim = clip(zoom_ax.YLim, lim(3), lim(4));
                        case 1
                            % one limit is out of bounds

                        case 2
                            % all good
                    end
                    
                end
            end
        end

        function selection = check_NaN(app, image, preview)
            % Function to check NaN/Inf in data/image
            %
            % Parameters:
            %    app (Quant4D)
            %    image (array) : image to be checked for the presence of NaNs
            %    preview (bool) : 
            %
            % Returns:
            %    selection

            arguments
                app
                image {mustBeNumericOrLogical} = 0;
                preview (1,1) {mustBeNumericOrLogical} = true;
            end
            
            selection="";
            if any(isnan(image), "all") || any(isinf(image), "all")
                title_text = 'NaN/Inf in Data!';
                message = "There are NaN/Inf values in the data! Which may " + ...
                          "indicate the data structure is not correctly set " + ...
                          "(e.g. wrong Data Type, Byte Order, Data Offset, " + ...
                          "Data Header/Footer, etc).\n\nIf any data are " + ...
                          "corrupt, NaNs can be set to 0.";

                % For preview only
                if preview
                    selection = notification_dialog(app, ...
                                                    'quest', ...
                                                    sprintf(message), ...
                                                    title_text, ...
                                                    ["Continue", "Set NaNs to 0"]);

                elseif app.dataset_parameters.pixels_binning > 1 || (app.dataset_parameters.footer + app.dataset_parameters.header) > 0
                    selection = notification_dialog(app, ...
                                                    'quest', ...
                                                    sprintf(message+"\n\nRe-importing with corrected configuration is suggested."), ...
                                                    title_text, ...
                                                    ["Continue", "Set NaNs to 0"]);
                
                else
                    selection = notification_dialog(app, ...
                                                    'quest', ...
                                                    sprintf(message+"\n\nDo you want to swap the byte-order?"), ...
                                                    title_text, ...
                                                    ["Yes, try to swap the byte-order", "No"]);
                    
                    % Select the Data Info tab and bring Settings to the front
                    app.SettingsTabGroup.SelectedTab = app.InfoTab;
                    figure(app.Quant4D_Fig)
                    figure(app.figures.Settings) 
                    
                    % Execute the swap byte order callbacks
                    if startsWith(selection, "Yes")
                        dataset_options_callbacks(app,struct("Source",app.SwapByteOrder,"EventName", "ButtonPushed"))
                    end
                end
            end
        end

        function get_screen_info(app)
            % Function to check the size of various screen attributes.
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % Screen size, work area and window decorations (works without Java)
            info = quant4d.screenInfo();
            for name = ["screen_size" "monitor_positions" "screen_pixel_scale" "title_height" "decor_height" "decor_width" "screen_avail"]
                app.sys_constants.(name) = info.(name);
            end
        end

        function get_sys_constants(app)
            % Function to get/set system constants 
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % Default app background color
            app.sys_constants.background_color = app.Quant4D_Fig.Color;

            % highlight state buttons when enabled
            app.sys_constants.highlight_color = [0.702, 1.00, 0.702];
            
            % Warning color
            app.sys_constants.warning_color = [1.00, 0.65, 0.00];
            
            % Get native endianness
            [~,~,endian] = computer();
            app.sys_constants.system_endianness = lower(endian);
            app.sys_constants.endian_text = struct("l",'Little Endian',"b",'Big Endian');
        end

        function save_vector_field(app)
            % Function to save vector field images.
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

                % Create temporary figure with axes
                fig = figure("Visible", "on");
                ax = axes(fig);
                ax.NextPlot = "replace";
                imagesc(ax, app.images.CoMPh, "AlphaData", app.images.CoMMagNorm);
                set(ax, ...
                    "DataAspectRatio", [1 1 1], ...
                    "XTick", [], ...
                    "YTick", [], ...
                    "YDir", "reverse", ...
                    "Color", "k");
                axis(ax, app.common_parameters.real_axes_limit);
                colormap(ax, hsv);

                % get the vector field sampling (1:1, 1:2, etc)
                vec = app.image_axes.CoMPhMag.UserData.vector_field;

                set(ax, "NextPlot", "add");
                quiver(ax, ...
                       1:vec:app.dataset_parameters.n_frames(1),...
                       1:vec:app.dataset_parameters.n_frames(2),...
                       -app.images.CoMX(1:vec:end,1:vec:end)./vec,...
                       -app.images.CoMY(1:vec:end,1:vec:end)./vec,...
                       1/vec,"w");
                set(ax, ...
                    "DataAspectRatio", [1 1 1], ...
                    "XTick", [], ...
                    "YTick", [], ...
                    "YDir", "reverse", ...
                    "NextPlot", "replace");
                axis(ax, app.common_parameters.real_axes_limit);

                % Save as a .png, .fig, and .pdf (vector image, not pixelated)
                %fig.InvertHardcopy = "off";
                exportgraphics(fig,strcat(app.SaveImagePrefix.Value, "VectField.png"), "Resolution", 1000, "BackgroundColor", "k");
                saveas(fig,strcat(app.SaveImagePrefix.Value, "VectField.fig"));
                exportgraphics(fig,"VectField_vector.pdf", 'ContentType', 'vector', "BackgroundColor","K")
                fig.Visible = "off";

                % write vector field to a comma-separated text file
                writematrix([-app.images.CoMX(1:vec:end,1:vec:end)./vec ...
                             -app.images.CoMY(1:vec:end,1:vec:end)./vec], ...
                             strcat(app.SaveImagePrefix.Value, "vector_field.txt"));
                
                close(fig);
        end

        function clear_detectors(app)
            % Function to delete plotted detectors if they exist.
            %
            % Parameters:
            %    app (Quant4D)
            %
            % Returns:
            %    None

            % Transmitted Beam alignment
            delete(findobj(app.image_axes.Diffraction, "Tag","TransBeamAnnot"))

            % Annular/Round detectors and Segmented detectors
            delete(findobj(app.image_axes.Diffraction, '-regexp', "Tag", "AnnDetrAnnot"))
            delete(findobj(app.image_axes.Diffraction, "Tag", "SegDetrAnnot"))

            % Virtual apertures
            delete(findobj(app.image_axes.Diffraction, "Tag", "VrApertAnnot"))

            % Custom detectors - hide Custom ROIs only
            set(findobj(app.image_axes.Diffraction.Children, '-regexp', "Tag", "Custom "), "Visible", false);

            % Scan direction alignment
            delete(findobj(app.image_axes.Diffraction, "Tag", "ScanDirAnnot"))
        end

        function draw_real_ROI(app, event, roi_type)
            % Function to draw Real-space ROI of various shapes on real space image(s)
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %    roi_type (str) : "full", "point", "ellipse", "rectangle", "poly", "file"
            %
            % Returns:
            %    None

            arguments
                app
                event
                roi_type {mustBeText, mustBeMember(roi_type,{'full', 'point', 'ellipse', 'rectangle', 'poly', 'file'})} = 'full';
            end

            % Delete all previous ROIs
            delete(findobj(app.ui_groups.real_axes, "Tag",'Real-space ROI'))

            % set roi polygon color
            color = [1 0.5 0.5];

            % Special case for drawing polygon ROI
            if roi_type == "poly"
                % List for available real-space images
                real_space_images = app.ui_groups.image_space == "Real" & ...
                                   app.ui_groups.image_type ~= "Mask" & ...
                                   ismember(app.ui_groups.image_id,app.DisplayImage.ItemsData);

                if sum(real_space_images) == 1
                    selection = 1;
                else
                    selection = notification_dialog(app, ...
                                              'list', ...
                                              sprintf("Select a Real-space Image to draw a polygon ROI.\n\n" + ...
                                                "Press 'Esc' to cancel during drawing. Please refer to MATLAB's 'drawpolygon' for more tips.\n"), ...
                                              "Draw Polygon ROI", ...
                                              app.ui_groups.image_name(real_space_images));
                end
                
                % Revert to "full" is canceled
                if isempty(selection)
                    mock_UI_callbacks(app, app.RealROIShape, "full");
                    return;
                end
                
                % Bring selected image window to front
                options = app.ui_groups.image_id(real_space_images);
                selection_index = options(selection);
                ax = app.image_axes.(selection_index);
                figure(app.figures.(selection_index))
                
                % Disable UIs until drawing finishes
                enable_windows(app, false)
                
                % Enable the selected image only
                app.figures.(selection_index).UserData.grayout.Visible = "off";
                
                % Draw temporary polygon for positions
                tmp_polygon = drawpolygon(ax, "Color", color);
                polygon_position = tmp_polygon.Position;
                delete(tmp_polygon)

                % Re-enable all windows
                enable_windows(app,true)
                
                % Revert to "full" is canceled
                if isempty(polygon_position)
                    mock_UI_callbacks(app, app.RealROIShape, "full");
                    return;
                end
            end
            
            % Draw ROIs on Real-space images, except the mask image
            real_space_limits = range([app.image_axes.Real.XLim; app.image_axes.Real.YLim]'); 
            pos = [app.RealROIFrameX.Value app.RealROIFrameY.Value];

            for selection_index = app.ui_groups.image_id(app.ui_groups.image_space == "Real" & app.ui_groups.image_type ~= "Mask")'
                switch roi_type
                    case "full"
                        roi = drawrectangle(app.image_axes.(selection_index), ...
                                            "Position", [1 1 real_space_limits], ...
                                            "Visible", 0, ...
                                            "EdgeAlpha", 0, ...
                                            "FaceAlpha", 0);
                    
                    case "point"
                        roi = drawpoint(app.image_axes.(selection_index), ...
                                        "Position",pos);
                    
                    case "ellipse"
                        roi = drawellipse(app.image_axes.(selection_index), ...
                                          "Center", pos, ...
                                          "SemiAxes", min(0.1*real_space_limits)*[1 1], ...
                                          "FaceAlpha", 0);
                    
                    case "rectangle"
                        roi = drawrectangle(app.image_axes.(selection_index), ...
                                            "Position", [pos-0.1*real_space_limits, 0.2*real_space_limits], ...
                                            "Rotatable", true, ...
                                            "FaceAlpha",0);
                    
                    case "poly"
                        roi = drawpolygon(app.image_axes.(selection_index), ...
                                          "Position", polygon_position, ...
                                          "FaceAlpha", 0);
                    
                    case "file"
                        roi = drawrectangle(app.image_axes.(selection_index), ...
                                            "Position", [1 1 real_space_limits], ...
                                            "Visible", 0, ...
                                            "EdgeAlpha", 0, ...
                                            "FaceAlpha",0);
                        bw = visboundaries(app.image_axes.(selection_index), ...
                                           bwboundaries(app.images.RealROIFile'), ...
                                           "Color",color, ...
                                           "EnhanceVisibility",0);
                        bw.Tag = 'Real-space ROI';
                end

                set(roi, ...
                    "Deletable", true, ...
                    "Color", color, ...
                    "Tag", "Real-space ROI");

                roi.UserData.Move = addlistener(roi, "MovingROI", @app.move_real_ROI);
                addlistener(roi, "ROIMoved", @app.move_real_ROI);
                addlistener(roi, "DeletingROI", @app.move_real_ROI);
                app.annotations.RealROI.(selection_index) = roi;
            end

            move_real_ROI(app, app.annotations.RealROI.Real, event)
        end

        function move_real_ROI(app, source, event)
            % Function to move Real-space ROIs on real space image(s)
            %
            % Parameters:
            %    app (Quant4D)
            %    source (images.roi.Rectangle | images.roi.Point | images.roi.Ellipse | images.roi.Polygon) : Real-space ROIs
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            
            % if the user deletes the ROI, revert to `Full Image`
            if strcmp(event.EventName, 'DeletingROI')
                app.RealROIShape.Value = "full";
                mock_UI_callbacks(app, app.RealROIShape, "full");
                return;
            end

            % Update panel values for individual probe positions
            roi = app.annotations.RealROI.Real;
            x = app.RealROIFrameX.Value;
            y = app.RealROIFrameY.Value;
            
            switch source
                case app.RealROIFrameX
                    % Force X >= 1
                    x = max(1, event.Value);
                
                case app.RealROIFrameY
                    % Force Y >= 1
                    y = max(1, event.Value);

                case app.diffraction_dropdown
                
                otherwise % E.g. ROIs
                    roi = source;
                    switch app.RealROIShape.Value
                        case {'rectangle', 'full', 'file'}
                            position = source.Position(1:2) + source.Position(3:4)/2;
                            x = position(1);
                            y = position(2);
                        case 'point'
                            x = source.Position(1);
                            y = source.Position(2);
                        case 'ellipse'
                            x = source.Center(1);
                            y = source.Center(2);
                        case 'poly'
                            % avoid any warnings that arise when:
                            % 'Polyshape has duplicate vertices,
                            % intersections, or other inconsistencies
                            % that may produce inaccurate or unexpected
                            % results. Input data has been modified to
                            % create a well-defined polyshape.'
                            warning('off','MATLAB:polyshape:repairedBySimplify');
                            [x, y] = centroid(polyshape(source.Position));
                    end
            end

            x = round(x);
            y = round(y);

            % Set current ROI position if called from `app.RealROIFrameX` or `app.RealROIFrameY`, and it's a point ROI
            if ismember(source, [app.RealROIFrameX, app.RealROIFrameY]) && app.RealROIShape.Value == "point"
                roi.Position = [x y];
            end
            
            % Update UI
            set_external_source(app, event,[app.RealROIFrameX, app.RealROIFrameY],{"Value"},{x;y})
            
            % Only update ROIs on other visible figures; update all when not in "changing" Event
            roi_struct = structfun(@(i) i, app.annotations.RealROI);
            roi_struct = roi_struct(arrayfun(@(i) ancestor(i,'figure').Visible, roi_struct) | is_static_event(app, event));
            
            % Sync existing properties of positions etc.
            for prop = ["Position" "Center" "SemiAxes" "RotationAngle"]
                if isprop(roi, prop)
                    set_external_source(app, event, roi_struct, prop, roi.(prop));
                end
            end

            % Update images
            if to_update_image(app, event)
                % generate a mask for displaying diffraction pattern
                switch app.RealROIShape.Value
                    case "full"
                        mask_real = true(app.dataset_parameters.n_frames);
                    
                    case 'point'
                        mask_real = false(app.dataset_parameters.n_frames);
                        mask_real(x, y) = true;
                    
                    case 'file'
                        mask_real = app.images.RealROIFile;
                    
                    otherwise
                        mask_real = createMask(app.annotations.RealROI.Real, app.image_displays.Real)';
                end

                % Convert to single/double
                mask_real = cast(mask_real,app.dataset_parameters.data_type);

                % Invert mask?
                if app.RealROIInvert.Value
                    mask_real = max(mask_real,[], "all") - mask_real;
                end

                % Store the mask for plotting/saving
                app.images.RealMask = mask_real;
                app.masks.real = mask_real;

                % Update diffraction pattern for the specified ROI; special
                % case to speed up `point` as it does not require the
                % entire dataset to be multiplied
                if strcmp(app.RealROIShape.Value, "point")
                    app.images.Diffraction = gather(reshape(app.data(:,mask_real==1), app.dataset_parameters.n_pixels));
                else
                    switch app.diffraction_dropdown.Value
                        case 'max'
                            app.images.Diffraction = gather(reshape(max(app.data.*reshape(mask_real, 1, []), [],2), app.dataset_parameters.n_pixels));

                        case 'std'
                            app.images.Diffraction = gather(reshape(std(app.data.*reshape(mask_real, 1, []), [],2), app.dataset_parameters.n_pixels));

                        otherwise % sum, mean, sqrt, ln, log10
                            app.images.Diffraction = gather(reshape(app.data*reshape(mask_real, [], 1), app.dataset_parameters.n_pixels));
                    end
                end
                
                % add operation on top of summed data
                switch app.diffraction_dropdown.Value
                    case 'mean'
                        app.images.Diffraction = app.images.Diffraction / sum(mask_real, "all");

                    case 'sqrt'
                        app.images.Diffraction = real(sqrt(app.images.Diffraction));
                    
                    case 'ln'
                        app.images.Diffraction = clip(real(log(app.images.Diffraction)),0,Inf);
                    
                    case 'log10'
                        app.images.Diffraction = clip(real(log10(app.images.Diffraction)),0,Inf);
                end

                plot_all_patterns(app, event)
            end

            debug_toc(app, event, "", debug_time)
        end

        function get_fields(app, tree_node, variable_struct)
            % Function to recursively get all fields on a TreeNode so the
            % user can view important internal variables and values
            %
            % Parameters:
            %    app (Quant4D)
            %    tree_node (TreeNode) : matlab.ui.container.TreeNode
            %    variable_struct (struct) : structure containing variables or parameters
            %
            % Returns:
            %    None

            if ~isstruct(variable_struct)
                return
            end
            
            fnames = fieldnames(variable_struct);

            for i_field = 1:numel(fnames)
                field_name = fnames{i_field};

                item = variable_struct.(field_name);

                % recursively interrogate struct
                if isa(item,'struct')
                    % only add uitreenode if it doesn't already exists
                    parent = findobj(tree_node,'Text',field_name,'Type','uitreenode');
                    if isempty(parent) || ~isvalid(parent)
                        parent = uitreenode(tree_node, "Text", field_name);
                    end
                    get_fields(app, parent, item)
                end

                % only add uitreenode if it doesn't already exists
                h = findobj(tree_node,'Text',field_name,'Type','uitreenode');
                if isempty(h) || ~isvalid(h)
                    uitreenode(tree_node, "Text", field_name);
                end
            end
        end

        function [frame, err] = preview_frame(app, probe_position)
            % Function to import a single detector frame for previewing
            %
            % Parameters:
            %    app (Quant4D)
            %    probe_position ([int int]) : probe position to be previewed
            %
            % Returns:
            %    frame (array) : detector frame, cropped and binned as set by the user
            %    err (int) : fseek status for error handling

            % one probe position, cropped/binned like the import; see quant4d.readRaw
            pv = app.tmp_variables.Preview;
            err = 0;
            try
                frame = quant4d.readRaw(pv.file_path, [pv.n_pixels_total pv.n_frames_total], ...
                    Order = app.ImportAxisOrder.Value, DataType = pv.data_type, ...
                    ByteOrder = pv.byte_orer, Offset = pv.offset, Header = pv.header, Footer = pv.footer, ...
                    PixelStart = pv.pixels_start, NumPixels = pv.n_pixels, Binning = pv.pixels_binning, ...
                    FrameStart = probe_position, NumFrames = [1 1]);
            catch
                frame = [];
                err = -1;
            end
        end

    end       


    % Callbacks that handle component events
    methods

        % Code that executes after component creation
        function startup_function(app, debug)
            % Code that executes after component creation
            %
            % Parameters:
            %    app (Quant4D)
            %    debug (bool) : Enable (true), disable (false) timings for debugging
            %
            % Returns:
            %    None
            
            arguments
                app;
                debug (1,1) {mustBeNumericOrLogical} = false;
            end

            debug_time = tic;

            % add app to workspace for user interaction
            debug_time2 = tic;
            assignin('base', 'app', app)
            debug_toc(app, [], "assignin finished", debug_time2)

            % Non-0 values if debugging
            debug_time2 = tic;
            app.debug = debug;
            debug_toc(app, [], "debug finished", debug_time2)

            % make sure slider ticks are off
            debug_time2 = tic;
            set(findobj(app.Quant4D_Fig,'Type','uirangeslider','-or','Type','uislider'),'MinorTicks',[])
            set(findobj(app.Quant4D_Fig,'Type','uirangeslider','-or','Type','uislider'),'MajorTicks',[])
            %set(findobj(app.figures.Settings,'Type','uirangeslider','-or','Type','uislider'),'MinorTicks',[])
            %set(findobj(app.figures.Settings,'Type','uirangeslider','-or','Type','uislider'),'MajorTicks',[])
            debug_toc(app, [], "set(findobj( finished", debug_time2)

            % Hide until startup process is ready
            debug_time2 = tic;
            app.Quant4D_Fig.Visible = "off"; 
            debug_toc(app, [], "Visible finished", debug_time2)

            % get/set system info
            debug_time2 = tic;
            get_screen_info(app)
            debug_toc(app, [], "get_screen_info finished", debug_time2)
            debug_time2 = tic;
            get_sys_constants(app)
            debug_toc(app, [], "get_sys_constants finished", debug_time2)
            debug_time2 = tic;
            get_memory(app);
            debug_toc(app, [], "get_memory finished", debug_time2)
            debug_time2 = tic;
            get_GPU(app);
            debug_toc(app, [], "get_GPU finished", debug_time2)

            % Disable histogram interactions
            debug_time2 = tic;
            app.HistogramAxes.Interactions = [];
            debug_toc(app, [], "HistogramAxes finished", debug_time2)
            
            % Setup "Custom Detector" tables
            debug_time2 = tic;
            set(app.CustomDetectorTable, ...
                'SelectionType','row', ...
                'Multiselect',0, ...
                'Data',table('Size',[0 6], ...
                             'VariableTypes',{'string','string','string','logical','logical','double'}, ...
                             'VariableNames',{'ID','Type','Label', 'Enable','Show','Weight'}));
            app.CustomDetectorDetailsTable.ColumnFormat = {'bank','bank','bank'};
            debug_toc(app, [], "CustomDetectorDetailsTable finished", debug_time2)
            
            % Create Other Panel and Image Windows
            debug_time2 = tic;
            create_other_windows(app)
            debug_toc(app, [], "create_other_windows finished", debug_time2)

            % Keep UIs disabled
            debug_time2 = tic;
            enable_windows(app,false)
            debug_toc(app, [], "enable_windows finished", debug_time2)

            % Reset app UI and data, which enters Import Preview Mode
            debug_time2 = tic;
            reset_Quant4D(app, struct("Source", "startup_function", "EventName",[]))
            debug_toc(app, [], "reset_Quant4D finished", debug_time2)

            % make main app UI visible
            debug_time2 = tic;
            app.Quant4D_Fig.Visible = "on";
            debug_toc(app, [], "Visible finished", debug_time2)

            % reset diffraction view type
            debug_time2 = tic;
            app.diffraction_dropdown.Value = 'sum';
            debug_toc(app, [], "diffraction_dropdown finished", debug_time2)

            % Plot axes display directions
            debug_time2 = tic;
            mock_UI_callbacks(app, app.ShowDiffractionAxes);
            debug_toc(app, [], "ShowDiffractionAxes finished", debug_time2)
            debug_time2 = tic;
            mock_UI_callbacks(app, app.ShowDiffractionAxes)
            debug_toc(app, [], "ShowDiffractionAxes finished", debug_time2)
            
            % Link axes limits for zooming. linkprop is used instead of linkaxes, which hangs at startup on R2026b; keep the link objects in app data so they stay alive.
            debug_time2 = tic;
            setappdata(app.Quant4D_Fig, "real_axes_link", linkprop(app.ui_groups.real_axes, {"XLim", "YLim"}));
            debug_toc(app, [], "real_axes finished", debug_time2)
            debug_time2 = tic;
            setappdata(app.Quant4D_Fig, "diffraction_axes_link", linkprop(app.ui_groups.diffraction_axes, {"XLim", "YLim"}));
            debug_toc(app, [], "diffraction_axes finished", debug_time2)

            % populate variable viewer 
            debug_time2 = tic;
            variable_viewer(app, struct())
            debug_toc(app, [], "variable_viewer finished", debug_time2)

            debug_toc(app, [], "`startup_function` finished", debug_time)
        end

        % Callback function: CancelImport, ImportData, ReimportMenu, 
        % ...and 1 other component
        function import_callbacks(app, event)
            % Function called when the user clicks ImportData,
            % CancelImport, or ShowImportWindow (on the main UI). 
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch event.Source
                case app.ShowImportWindow
                    figure(app.figures.Import)
                    
                    % Enter Import Preview Mode
                    if app.Mode.Value ~= "Preview"
                        mock_UI_callbacks(app, app.Mode, "Preview");
                    end

                case app.CancelImport
                    % Hide window when closing
                    app.figures.Import.Visible = "off";
                    
                    % Try to re-enter previous detector mode from Import Preview Mode
                    if app.Mode.Value == "Preview" && isfield(app.common_parameters,'detector_mode')
                        mock_UI_callbacks(app, app.Mode, app.common_parameters.detector_mode);
                    end

                case app.ReimportMenu
                    % Re-import the current dataset, mostly for debugging
                    if ~isfield(app.tmp_variables,'prev_D')
                        return;
                    end
                    
                    unload_data(app)
                    app.dataset_parameters = app.tmp_variables.prev_D;
                    import_data(app, event)

                case {app.ImportData app.PreviewButton}
                    % When the "Import Data" or "Preview" button is pressed
                    app.tmp_variables.Preview = [];

                    if ~isfile(app.ImportFilePath.Value)
                        notification_dialog(app, ...
                                            "warn", ...
                                            'The entered file path is invalid!', ...
                                            'Invalid File!');
                    
                    elseif app.ImportDataType.Value == "unknown"
                        notification_dialog(app, ...
                                            "warn", ...
                                            'Select the correct data type!', ...
                                            'Select Data Type!');
                    
                    else
                        if event.Source == app.ImportData
                            % Import data
                            app.figures.Import.Visible = "off";
                            
                            % unload data unless `SwapDataset` is ticked
                            unload_data(app, app.SwapDataset.Value)
                            
                            % gather all options from the Import UI, preview mode = false
                            app.dataset_parameters = gather_import_options(app, false);
                            
                            % Backup current `app.D`
                            app.tmp_variables.prev_D = app.dataset_parameters;
                            import_data(app, event)
                        else
                            % gather all options from the Import UI, preview mode = true
                            app.tmp_variables.Preview = gather_import_options(app, true);
                        end
                    end

                case {app.SwapDiffractionXY app.SwapRealXY}
                    % Refresh axes settings etc when dimensions swapped
                    prepare_data(app, event)

            end
        end

        % Callback function: ImportFilePath, ImportFileSelect
        function import_select_file(app, event)
            % Function called when the user clicks Select or updates
            % the file path on the Import UI (`ImportFileSelect` and
            % `ImportFilePath`, respectively)
            %
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            if event.Source == app.ImportFileSelect
                % Get user to select a file
                [fileName, fileDir] = uigetfile({'*.raw;*.mib;*.mrc;*.dm3;*.dm4;*.npy;*.h5;*.hdf5;*.hspy','Supported Formats'; ...
                                                 '*.*','All Files'}, ...
                                                 'Select 4DSTEM Dataset');
                
                % Force to show
                set(app.figures.Import,"Visible", "off","Visible", "on");
                
                if fileName
                    app.ImportFilePath.Value = fullfile(fileDir, fileName);
                end
            end

            if isfile(app.ImportFilePath.Value)
                % get file directory and extension
                [fileDir, ~, fileExt] = fileparts(app.ImportFilePath.Value);

                % change to directory containing dataset for future saving
                cd(fileDir)

                % get file size in bytes
                app.tmp_variables.FileSize = dir(app.ImportFilePath.Value).bytes;
                
                % Display actual file size in bytes and GiB
                app.ImportActualFilesize.Text = sprintf('%d bytes, %.1f GiB',app.tmp_variables.FileSize,app.tmp_variables.FileSize/1024^3);

                switch lower(fileExt)
                    case ".mib"
                        % Medipix data
                        app.Medipix.Value = true;
                    
                    case ".mrc"
                        % MRC data
                        app.MRC.Value = true;
                    
                    case {".dm3"; ".dm4"}
                        % Gatan K2/K3 data
                        app.DM34.Value = true;
                    
                    case {".h5"; ".hdf5"; ".hspy"}
                        app.HDF5.Value = true;
                    
                    case {".raw"}
                        app.EMPAD.Value = true;
                    
                    otherwise
                        app.Custom.Value = true;
                end
            
            else
                % if the file doesn't exist, revert to starting point
                app.ImportActualFilesize.Text = "";
                app.tmp_variables.FileSize = 0;
                
            end

            debug_toc(app, event, "", debug_time)

            % Further file info
            import_file_type(app, event)
        end

        % Callback function: FileTypeButtonGroup, SubDataset
        function import_file_type(app, event)
            % Function called when the user selects a new file type
            % category (`FileTypeButtonGroup`) or selects a new `SubDataset`
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % Make an initial guess at the file dimensions (assume ~square field of view: NFrX≈NFrY)
            debug_time = tic;

            % Medipix data are saved as a .mib file of varying bit-depth as unsigned integers of the next highest class
            %   (i.e. 12-bit is saved as a 16-bit unsigned integer) with big-endian ordering.
            % EMPAD data are saved as a .raw file with 32-bit depth with little endian ordering.
            % Fiji/ImageJ tend to save their files with big-endian ordering, though this is also system- and user-dependent.

            notes = "";
            err = 0;
            app.ImportDataType.Items = {'Select Data Type';
                                        '8-bit Signed';
                                        '8-bit Unsigned';
                                        '16-bit Signed';
                                        '16-bit Unsigned';
                                        '32-bit Real';
                                        '32-bit Signed';
                                        '32-bit Unsigned';
                                        '64-bit Real';
                                        '64-bit Signed';
                                        '64-bit Unsigned'};

            app.ImportDataType.ItemsData = {'unknown';
                                            'int8';
                                            'uint8';
                                            'int16';
                                            'uint16';
                                            'single';
                                            'int32';
                                            'uint32';
                                            'double';
                                            'int64';
                                            'uint64'};

            app.tmp_variables.dm = [];
            app.tmp_variables.h5 = [];
            set([app.DatasetOffset app.DataHeader app.DataFooter], "Value",0)
            app.tmp_variables.fileTail = 0;
            app.ImportByteOrder.Value = "l";
            app.ImportDataType.Value = "unknown";
            
            if event.Source == app.ImportFileSelect
                set(app.SubDataset, "Items",{}, "Enable", "off")
            end
            
            if isfile(app.ImportFilePath.Value)
                switch app.FileTypeButtonGroup.SelectedObject
                    case app.EMPAD
                        app.DataFooter.Value = 1024;
                        app.ImportDataType.Value = "single";
                        app.ImportPixelsX.Value = 128;
                        app.ImportPixelsY.Value = 128;
                        notes = sprintf('Pixels:\t128x128\n32-bit Real\n** EMPAD data have 1024-byte frame footers');
                        guess_frames_from_size(app);
                        get_dims_from_name(app, app.ImportFilePath.Value)

                        % check if file size matches (i.e. likely an EMPAD
                        % file), or if it suits better to set FrameHeader,
                        % FrameFoot, and DataOffset to 0 (i.e. a .raw
                        % binary file from simulation or other)
                        file_size = app.DatasetOffset.Value ...
                                    + (app.DataHeader.Value...
                                       + app.ImportPixelsX.Value ...
                                       * app.ImportPixelsY.Value ...
                                       * app.byte_size.(app.ImportDataType.Value) ...
                                       + app.DataFooter.Value ...
                                       ) ...
                                    * (app.ImportFramesX.Value* app.ImportFramesX.Value);
                        if file_size > dir(app.ImportFilePath.Value).bytes
                            test_size = app.ImportPixelsX.Value * ...
                                        app.ImportPixelsY.Value * ...
                                        app.ImportFramesX.Value * ...
                                        app.ImportFramesX.Value * ...
                                        app.byte_size.(app.ImportDataType.Value);
                            if test_size == dir(app.ImportFilePath.Value).bytes
                                app.Custom.Value = 1;
                                app.DataFooter.Value = 0;
                                app.DataHeader.Value = 0;
                                app.DatasetOffset.Value = 0;
                            end
                        end

                    case app.Medipix
                        app.ImportDataType.Items = ["Select Data Type"; ["1 or 6";"12";"24"]+"-bit Padded Unsigned"];
                        app.ImportDataType.ItemsData = {"unknown";"uint8";"uint16";"uint32"};
                        fid = fopen(app.ImportFilePath.Value,"r");
                        fmeta = strsplit(fread(fid, 128, 'uint8=>char')', ',');
                        
                        % Signature character in header
                        if numel(fmeta) >= 7 && ismember(lower(fmeta{7}(1)), ["r", "u"])
                            % Re-read with known header size
                            frewind(fid)
                            fmeta = strsplit(fread(fid, str2double(fmeta{3}), 'uint8=>char')', ',');
                            
                            dtype = lower(fmeta{7});
                            bitsize = str2double(fmeta(end-1));
                            
                            if dtype(1) == 'u'
                                switch bitsize
                                    case {1; 6}, app.ImportDataType.Value = "uint8";
                                    case 12, app.ImportDataType.Value = "uint16";
                                    case 24, app.ImportDataType.Value = "uint32";
                                end
                            end
                            
                            app.DataHeader.Value = str2double(fmeta{3});
                            app.ImportByteOrder.Value = "b";
                            app.ImportPixelsX.Value = str2double(fmeta{5});
                            app.ImportPixelsY.Value = str2double(fmeta{6});
                            notes = sprintf(['Dim: X = %s, Y = %s\nData type: %s\nPixel depth: %d bit\n' ...
                                             'Data header: %s bytes\nBig endian'], fmeta{5}, fmeta{6}, fmeta{7}, bitsize, fmeta{3});
                            guess_frames_from_size(app);
                            get_dims_from_name(app, app.ImportFilePath.Value)
                        
                        else
                            notes = 'Unrecognizable as a Medipix/.mib file.';
                            err = -1;
                        end
                        fclose(fid);

                    case app.MRC
                        % Read in MRC header - first 1024 bytes
                        fid = fopen(app.ImportFilePath.Value,"r");
                        fseek(fid,208,'bof');
                        map = fread(fid, [1, 4], 'uint8=>char');
                        
                        % Signature characters
                        if map == "MAP "
                            % Bytes for Endianness
                            e = fread(fid, 2, "uint8");
                            
                            if e(1) == 68 && ismember(e(2), [65, 68])
                                app.ImportByteOrder.Value = "l";
                                bo = 'Little Endian';
                            
                            elseif e(1) == 17 && e(2) == 17
                                app.ImportByteOrder.Value = "b";
                                bo = 'Big Endian';
                            
                            else
                                bo = 'Unknown Endianness';
                            
                            end

                            frewind(fid);
                            
                            % X, Y and Z, only 3D
                            dim = fread(fid,3,"uint32");
                            
                            app.ImportPixelsX.Value = dim(1);
                            app.ImportPixelsY.Value = dim(2);
                            app.ImportFramesX.Value = dim(3);
                            
                            guess_frames_from_dim3(app, dim(3))
                            get_dims_from_name(app, app.ImportFilePath.Value)

                            dtype = fread(fid,1,"uint32");
                            
                            switch dtype
                                case 0
                                    app.ImportDataType.Value = "int8";
                                    tnote = "8-bit Signed Integer";
                                
                                case 1
                                    app.ImportDataType.Value = "int16";
                                    tnote = "16-bit Signed Integer";
                                
                                case 2
                                    app.ImportDataType.Value = "single";
                                    tnote = "32-bit Real Float";
                                
                                case 3
                                    tnote = "16-bit Complex Signed Integer, unsupported";
                                
                                case 4
                                    tnote = "32-bit Complex Float, unsupported";
                                
                                case 6
                                    app.ImportDataType.Value = "uint16";
                                    tnote = "16-bit Unsigned Integer";
                                
                                otherwise
                                    tnote = "Uknown data type";
                            end

                            app.DatasetOffset.Value = 1024;
                            notes = sprintf('Dim: X = %d, Y = %d, Z = %d\n%s, %s\n** MRC files have a 1024-byte data offset', ...
                                dim, tnote, bo);
                        else
                            notes = sprintf('Unrecognizable as MRC.\n\n"MAP " word missed.');
                            err = -1;
                        end
                        fclose(fid);

                    case app.DM34
                        % Read .dm3/4 tag values
                        try app.tmp_variables.dm = dmInfo(app.ImportFilePath.Value);catch;end
                        
                        if iscell(app.tmp_variables.dm) && numel(app.tmp_variables.dm) > 1
                            % List all images' names in `app.SubDataset`
                            pdim = zeros(numel(app.tmp_variables.dm)-1, 1);
                            app.SubDataset.Enable = "on";
                            for i = 1:numel(pdim)
                                app.SubDataset.Items{i} = char(app.tmp_variables.dm{i}.Name);
                                pdim(i) = prod(cell2mat(app.tmp_variables.dm{i}.Dimensions));
                            end
                            
                            % Select sub-image with the largest dimension; unless manual selected
                            if event.Source == app.SubDataset
                                app.SubDataset.Value = event.Value;
                            else
                                [~, i] = max(pdim);
                                app.SubDataset.Value = app.SubDataset.Items{i};
                            end
                            
                            % Info of selected sub-image
                            dm = app.tmp_variables.dm{[strcmp(app.SubDataset.Items, app.SubDataset.Value), false]};
                            finfo = app.tmp_variables.dm{end};
                            
                            % Read dimensions
                            dims = dm.Dimensions;
                            
                            % Fill missing dimensions as 1
                            for i = 1:4
                                if i > numel(dims)
                                    dims{i} = 1;
                                end
                            end

                            set([app.ImportPixelsX, ...
                                 app.ImportPixelsY, ...
                                 app.ImportFramesX, ...
                                 app.ImportFramesY], ...
                                {"Value"}, dims)
                            
                            % Find offset, file tail, data type, byte-order of dataset
                            app.DatasetOffset.Value = dm.Data.offset;
                            try app.ImportDataType.Value = dm.Data.dataType; catch;end
                            app.tmp_variables.fileTail = finfo.fileSize - dm.Data.offset - dm.Data.size;
                            
                            % If pixels are not scalars (e.g. complex image)
                            if dm.ImageDataType.pixel ~= "scalar"
                                app.ImportDataType.Value = "unknown";
                            end

                            % Is it little endian?
                            if finfo.liEndian
                                app.ImportByteOrder.Value = "l";
                                bo = 'Little Endian';
                            else
                                app.ImportByteOrder.Value = "b";
                                bo = 'Big Endian';
                            end

                            notes = sprintf("Dim: X = %d, Y = %d, Z = %d, W = %d\nDM%d, %s\nData-type: %s\n" ...
                                +"Selected sub-image's offset is %d bytes.", ...
                                dims{:}, finfo.version, bo, dm.ImageDataType.full, dm.Data.offset);

                            if dims{4} == 1
                                guess_frames_from_dim3(app, dims{3});
                            end

                        else
                            notes = "Read DM file error: " + app.tmp_variables.dm;
                            err = -1;
                        end

                    case app.HDF5
                        try
                            app.tmp_variables.h5 = h5_datasets(app, app.ImportFilePath.Value);
                        catch
                            notes = 'Read HDF5 file error';
                            err = -1;
                        end

                        if ~err
                            app.SubDataset.Enable = "on";
                            % Select sub-image with the 1st largest dimension; unless manual selected
                            if event.Source ~= app.SubDataset
                                % List all images' names in `app.SubDataset`
                                pdim = zeros(numel(app.tmp_variables.h5)-1, 1);
                                for i = 1:numel(pdim)
                                    app.SubDataset.Items{i} = char(app.tmp_variables.h5(i).Name);
                                    pdim(i) = prod(app.tmp_variables.h5(i).Dataspace.Size);
                                end
                                [~, i] = max(pdim);
                                app.SubDataset.Value = app.SubDataset.Items{i};
                            end
                            
                            % Info of selected sub-image
                            h5i = app.tmp_variables.h5([strcmp(app.SubDataset.Items, app.SubDataset.Value), false]);
                            
                            % Read dimensions
                            dims = h5i.Dataspace.Size;
                            
                            % Fill missing dimensions as 1
                            for i = 1:4
                                if i > numel(dims)
                                    dims(i) = 1;
                                end
                            end
                            
                            % set Import UI values
                            set([app.ImportPixelsX; ...
                                 app.ImportPixelsY; ...
                                 app.ImportFramesX; ...
                                 app.ImportFramesY], ...
                                {"Value"},num2cell(dims)')
                            
                            % Find offset, file tail, data type, byte-order of dataset
                            if h5i.offset == -1
                                app.DatasetOffset.Value = 0;
                                noteoffs = 'This dataset is not "contiguous", thus data offset is unknown.';
                            else
                                app.DatasetOffset.Value = h5i.offset;
                                noteoffs = "Selected dataset's offset is "+h5i.offset+" bytes.";
                            end

                            app.tmp_variables.fileTail = app.tmp_variables.h5(end).size - app.DatasetOffset.Value - h5i.size;
                            
                            % If data type is unknown
                            if ~isempty(h5i.type)
                                app.ImportDataType.Value = h5i.type;
                            end

                            if endsWith(h5i.byte_order, "_BE")
                                app.ImportByteOrder.Value = "b";
                                bo = 'Big Endian';
                            else
                                app.ImportByteOrder.Value = "l";
                                bo = 'Little Endian';
                            end

                            notes = sprintf("Dim: X = %d, Y = %d, Z = %d, W = %d\n%s, %s\n%s", dims, bo, h5i.Datatype.Type, noteoffs);
                            
                            if dims(4) == 1
                                guess_frames_from_dim3(app, dims(3));
                            end
                        end

                    otherwise %case app.Custom
                        get_dims_from_name(app, app.ImportFilePath.Value)
                        app.ImportDataType.Value = "single";
                        notes = "Custom import";

                end
            else
                notes = "File path is invalid";
                err = -1;
            end

            app.ImportFileMetadata.Value = notes;

            if app.ImportDataType.Value == "unknown" &&  err ~= -1
                notification_dialog(app, ...
                                    "warn", ...
                                    "The data type indicated in the file's metadata is not supported/recognized.", ...
                                    "Invalid Data Type!");
            end

            debug_toc(app, event, "", debug_time)

            % Reset import range selections
            range_import_export(app, struct("Source", app.ImportPixelsX, "EventName", []));
            range_import_export(app, struct("Source", app.ImportFramesX, "EventName", []));
            import_box_input(app, event)
        end

        % Value changed function: DataFooter, DataHeader, DatasetOffset, 
        % ...and 21 other components
        function import_box_input(app, event)
            % Function called when the user interacts with the Import UI
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            
            % Decision D1: the Pixels fields are always the detector and the Frames fields
            % always the scan; the axis-order dropdown only tells the reader how the file
            % is laid out, so changing it no longer reorders the size fields.

            % initialize parameters
            app.ImportEstimatedFilesize.Text = "";
            notes = "";
            diffraction_event = event;
            real_event = event;

            if isfile(app.ImportFilePath.Value)
                % Update Diffraction and Real-space import ranges; use dummy event if source is not a range UI
                if ~contains(event.Source.Tag, "Diffraction")
                    diffraction_event = struct("Source",app.DiffractionPartialImportPixelsDist, "Value",app.DiffractionPartialImportPixelsDist.Value);
                end
                if ~contains(event.Source.Tag, "Real")
                    real_event = struct("Source",app.RealPartialImportFramesDist, "Value",app.RealPartialImportFramesDist.Value);
                end

                [diffraction_note, ~, ~, n_pixels, ~] = range_import_export(app, diffraction_event);
                [real_note, ~, ~, n_frames, ~] = range_import_export(app, real_event);
                notes = diffraction_note + real_note;
                
                % Enable/Disable Range UIs
                set(app.DiffractionPartialImportGrid.Children, "Enable", app.ImportPartialPixels.Value)
                set(app.RealPartialImportGrid.Children, "Enable", app.ImportPartialFrames.Value)
                
                % Current dataset dimensions
                irng = [n_pixels n_frames];
                
                % Allow for virtual memory mapping in some situations
                if app.DataHeader.Value == 0 && app.DataFooter.Value == 0 ...
                        && (~app.HDF5.Value || app.DatasetOffset.Value) ...
                        && app.ImportAxisOrder.Value == "kr" ...
                        && app.ImportByteOrder.Value == app.sys_constants.system_endianness && ~contains(app.ImportDataType.Value,'int') ...
                        && isequal([app.ImportPixelsX.Value app.ImportPixelsY.Value app.ImportFramesX.Value app.ImportFramesY.Value], irng)
                    app.MemoryType.Enable = "on";
                else
                    app.MemoryType.Enable = "off";
                    app.MemoryType.Value = "Physical Memory";
                end

                % Calculate dataset size and memory usage
                if app.ImportDataType.Value ~= "unknown"
                    bytesize = app.byte_size.(app.ImportDataType.Value);
                    if startsWith(app.ImportAxisOrder.Value, "kr")
                        app.tmp_variables.EstSize = app.DatasetOffset.Value + ...
                                                    app.tmp_variables.fileTail + ...
                                                    (app.DataHeader.Value + app.ImportPixelsX.Value*app.ImportPixelsY.Value*bytesize + app.DataFooter.Value) * app.ImportFramesX.Value*app.ImportFramesY.Value;
                    else
                        app.tmp_variables.EstSize = app.DatasetOffset.Value + ...
                                                    app.tmp_variables.fileTail + ...
                                                    (app.DataHeader.Value + app.ImportFramesX.Value*app.ImportFramesY.Value*bytesize + app.DataFooter.Value) * app.ImportPixelsX.Value*app.ImportPixelsY.Value;
                    end

                    app.ImportEstimatedFilesize.Text = sprintf('%d bytes, %.1f GiB',app.tmp_variables.EstSize,app.tmp_variables.EstSize/1024^3);

                    if contains(app.ImportDataType.Value,'int')
                        if bytesize > 4
                            f = "double";
                        else
                            f = "single";
                        end
                        bytesize = app.byte_size.(f);
                        notes = notes+"\nDataset will be converted into "+bytesize*8+"-bit Real.";
                    end
                    notes = notes+"\nImport by "+app.MemoryType.Value+"\n"+check_memory(app, event, n_pixels, n_frames, bytesize);
                    notes = notes+"\n\n"+check_GPU_memory(app, n_pixels, n_frames);
                end
                
                % Allow to swap dataset/keep parameters if the dimensions are identical
                app.SwapDataset.Enable = ~isempty(app.dataset_parameters) && isequal(irng, [app.dataset_parameters.n_pixels(1) app.dataset_parameters.n_pixels(2) app.dataset_parameters.n_frames(1) app.dataset_parameters.n_frames(2)]);
                if ~app.SwapDataset.Enable
                    app.SwapDataset.Value = false;
                end
                
                if app.SwapDataset.Value
                    notes = notes+"\n\nSwapping dataset - keep current setups/alignments etc.";
                end
            else
                % default to GPU off when no file path is present
                app.GPU.Value = 0;
            end

            app.ImportSummary.Value = sprintf(notes);

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: AutoSaveImage, SaveDirectoryButton, 
        % ...and 12 other components
        function save_callbacks(app, event)
            % Function called when the user interacts with the Save/Export UI
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            
            % Try to update image name prefix
            update_prefix(app, event)

            switch event.Source
                case app.ShowSaveWindow
                    figure(app.figures.Save)
                    % Trigger tab change callbacks defined in `@app.export_callbacks()`
                    mock_UI_callbacks(app, app.SaveTabGroup);
                
                case app.SaveDirectoryButton
                    directory = uigetdir(app.SaveDirectoryPath.Value, 'Select Directory to Save Images');
                    drawnow
                    figure(app.figures.Save)
                    if directory
                        app.SaveDirectoryPath.Value = directory;
                    end

                case app.SaveDirectoryPath
                
                case {app.SaveImagePrefix app.SavePrefixAngleInner app.SavePrefixAngleOuter}
                
                case app.SaveImageList % Save image list selection change
                    % If user selects all of the images in the list, tick the "Save All" checkbox
                    app.SaveImageSelectAll.Value = numel(app.SaveImageList.Value) == numel(app.SaveImageList.Items);
                
                case {app.AutoSaveImage app.SaveExport} % Save images/Auto-save images or Export data
                    if app.SaveDirectoryPath.Value == "" || isempty(app.SaveDirectoryPath.Value)
                        notification_dialog(app, "warn",sprintf("Please specify the directory!"),'Directory Missing');
                    else
                        % Create directory if not exists
                        [success, error_message] = mkdir(app.SaveDirectoryPath.Value);
                        if ~success
                            notification_dialog(app, "warn",sprintf("Failed to create directory!\n\n"+error_message),'Directory Error');
                        else
                            % Save images if called from `app.AutoSaveImage` or currently the `app.SaveImagesTab` is selected
                            if app.SaveTabGroup.SelectedTab == app.SaveImagesTab || event.Source == app.AutoSaveImage
                                % Save images
                                save_images(app);
                            else
                                % Export data
                                export_callbacks(app, event)
                            end
                        end
                    end
                
                case app.SaveImageSelectAll % Select all/none
                    if event.Value
                        app.SaveImageList.Value = app.SaveImageList.ItemsData;
                    else
                        app.SaveImageList.Value = {};
                    end
                
                case {app.SaveImagePNG app.SaveImageAnnotations}
                    % Enable/Disable PNG options
                    app.SaveImageAnnotations.Enable = app.SaveImagePNG.Value;
                    set([app.SaveImageDPI app.SaveImgAnnotDPILabel], ...
                        "Enable", ...
                        app.SaveImageAnnotations.Value && app.SaveImagePNG.Value)
            end

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: DiffractionPartialExportPixelsDist, 
        % ...and 17 other components
        function export_callbacks(app, event)
            % Function called when the user interacts with the Save/Export UI
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            switch event.Source
                case app.SaveCloseButton % Close button on Save/Export Window
                     % Try to remove Export ROIs
                    delete(findobj(app.ui_groups.image_axes,'-regexp', "Tag",'Export .* ROI'))
                    
                    % Reset button color
                    app.SaveCloseButton.BackgroundColor = app.sys_constants.background_color;

                    % hide save window
                    app.figures.Save.Visible = "off";

                case {app.SaveTabGroup, app.ExportPartialPixels, app.ExportPartialFrames} % Tab change or enable/disable partial export
                    % Try to delete old ROIs
                    delete(findobj(app.ui_groups.image_axes,'-regexp', "Tag",'Export .* ROI'))

                    % Try to update export range
                    if ~isempty(app.dataset_parameters)
                        update_export_range(app, event);
                    end
                    
                    if app.SaveTabGroup.SelectedTab == app.ExportDatasetTab && app.figures.Save.Visible
                        % To start Export Data Mode
                        app.SaveExport.Text = "Export Data";

                        % Draw ROIs & add listening functions for live updates on all Real and Diffraction space images
                        for id = app.ui_groups.image_id(app.ui_groups.image_space ~= "ColorWheel" & app.ui_groups.image_type ~= "Mask")'
                            app.annotations.Export.(id) = drawrectangle(app.image_axes.(id), ...
                                                                        "Position", [1 1 0 0], ...
                                                                        "Color", "y", ...
                                                                        "Deletable", 0, ...
                                                                        'FaceAlpha', 0, ...
                                                                        'FaceSelectable', 0);
                            app.annotations.Export.(id).Tag = "Export " + app.image_axes.(id).UserData.space + " ROI";
                            
                            % add listeners for ROI annotation movement
                            app.annotations.Export.(id).UserData.Move = addlistener(app.annotations.Export.(id), "MovingROI", @app.move_export_annotation);
                            addlistener(app.annotations.Export.(id), "ROIMoved", @app.move_export_annotation);
                        end

                        % Force ROIs to update
                        export_callbacks(app, struct("Source", app.DiffractionPartialExportXStart, ...
                                                     "EventName", "ValueChanged", ...
                                                     "Value", app.DiffractionPartialExportXStart.Value))

                        export_callbacks(app, struct("Source", app.RealPartialExportXStart, ...
                                                     "EventName", "ValueChanged", ...
                                                     "Value", app.RealPartialExportXStart.Value))
                        
                        % Show/Hide ROIs and enable/disable UIs if (not) selecting whole ranges
                        set(findobj(app.ui_groups.diffraction_axes, "Tag",'Export Diffraction ROI'), "Visible", app.ExportPartialPixels.Value)
                        set(findobj(app.ui_groups.real_axes, "Tag",'Export Real ROI'), "Visible", app.ExportPartialFrames.Value)
                        set(app.RealPartialExportGrid.Children, "Enable", app.ExportPartialFrames.Value)
                        set(app.DiffractionPartialExportGrid.Children, "Enable", app.ExportPartialPixels.Value)
                        
                        % Set close button color to hint/link with the ROIs
                        if app.ExportPartialPixels.Value || app.ExportPartialFrames.Value
                            c = 'y';
                        else
                            c = app.sys_constants.background_color;
                        end
                    
                    else % For "Save Images"
                        app.SaveExport.Text = "Save Images";
                        c = app.sys_constants.background_color;
                    end

                    % Color the close button to hint/link with the ROIs
                    app.SaveCloseButton.BackgroundColor = c;

                case {app.ExportDimensionSuffix app.ExportDataType app.ExportByteOrder}
                    update_export_range(app, event);
                
                case app.SaveExport % Export Button
                    try
                        export_data(app, event);
                    catch ME
                        % delete the progress dialog and export file
                        try delete(app.tmp_variables.progress_dialog); catch; end
                        try delete(app.tmp_variables.efile); catch; end
                        
                        % Reshape dataset to 2D
                        try app.data = reshape(app.data, prod(app.dataset_parameters.n_pixels), []);  catch; end
                        enable_windows(app,true)

                        % pass along error message
                        rethrow(ME)
                    end
                
                case {app.DiffractionPartialExportXStart,...
                      app.DiffractionPartialExportYStart,...
                      app.DiffractionPartialExportX,...
                      app.DiffractionPartialExportY}

                    if ismember(event.Source, [app.DiffractionPartialExportXStart, app.DiffractionPartialExportYStart])
                        % limit the number of export frames based on number
                        % of total frames and starting frame number
                        app.DiffractionPartialExportX.Value = clip(app.DiffractionPartialExportX.Value, 1, app.dataset_parameters.n_pixels(1) - app.DiffractionPartialExportXStart.Value + 1);
                        app.DiffractionPartialExportY.Value = clip(app.DiffractionPartialExportY.Value, 1, app.dataset_parameters.n_pixels(2) - app.DiffractionPartialExportYStart.Value + 1);
                    elseif app.DiffractionPartialExportX.Value + app.DiffractionPartialExportXStart.Value > app.dataset_parameters.n_pixels(1) + 1
                        app.DiffractionPartialExportXStart.Value = app.dataset_parameters.n_pixels(1) - app.DiffractionPartialExportX.Value + 1;
                    elseif app.DiffractionPartialExportY.Value + app.DiffractionPartialExportYStart.Value > app.dataset_parameters.n_pixels(2) + 1
                        app.DiffractionPartialExportYStart.Value = app.dataset_parameters.n_pixels(2) - app.DiffractionPartialExportY.Value + 1;
                    end

                    pos = [app.DiffractionPartialExportXStart.Value,...
                           app.DiffractionPartialExportYStart.Value,...
                           app.DiffractionPartialExportX.Value * app.DiffractionPartialExportPixelsDist.Value,...
                           app.DiffractionPartialExportY.Value * app.DiffractionPartialExportPixelsDist.Value];

                    app.annotations.Export.Diffraction.Position  = pos;

                
                case {app.RealPartialExportXStart,...
                      app.RealPartialExportYStart,...
                      app.RealPartialExportX,...
                      app.RealPartialExportY}
                    
                    if ismember(event.Source, [app.RealPartialExportXStart, app.RealPartialExportYStart])
                        % limit the number of export frames based on number
                        % of total frames and starting frame number
                        app.RealPartialExportX.Value = clip(app.RealPartialExportX.Value, 1, app.dataset_parameters.n_frames(1) - app.RealPartialExportXStart.Value + 1);
                        app.RealPartialExportY.Value = clip(app.RealPartialExportY.Value, 1, app.dataset_parameters.n_frames(2) - app.RealPartialExportYStart.Value + 1);
                    elseif app.RealPartialExportX.Value + app.RealPartialExportXStart.Value > app.dataset_parameters.n_frames(1)
                        app.RealPartialExportXStart.Value = app.dataset_parameters.n_frames(1) - app.RealPartialExportX.Value + 1;
                    elseif app.RealPartialExportY.Value + app.RealPartialExportYStart.Value > app.dataset_parameters.n_frames(2)
                        app.RealPartialExportYStart.Value = app.dataset_parameters.n_frames(2) - app.RealPartialExportY.Value + 1;
                    end

                    pos = [app.RealPartialExportXStart.Value,...
                           app.RealPartialExportYStart.Value,...
                           app.RealPartialExportX.Value * app.RealPartialExportFramesDist.Value,...
                           app.RealPartialExportY.Value * app.RealPartialExportFramesDist.Value];

                    app.annotations.Export.Real.Position  = pos;
                    
                case {app.RealPartialExportFramesDist, ...
                      app.DiffractionPartialExportPixelsDist}

                    % Try to update export range
                    if ~isempty(app.dataset_parameters)
                        update_export_range(app, event);
                    end

                case app.annotations.Export.Diffraction
                    pos = round(event.Source.Position);
                    pos(3:4) = round(pos(3:4) / app.DiffractionPartialExportPixelsDist.Value);
                    pos = clip(pos,1,repmat(app.dataset_parameters.n_pixels,1,2));
                    app.DiffractionPartialExportXStart.Value = pos(1);
                    app.DiffractionPartialExportYStart.Value = pos(2);
                    app.DiffractionPartialExportX.Value = pos(3);
                    app.DiffractionPartialExportY.Value = pos(4);

                otherwise % real-space export annotations
                    pos = round(event.Source.Position);
                    pos(3:4) = round(pos(3:4) / app.RealPartialExportFramesDist.Value);
                    pos = clip(pos,1,repmat(app.dataset_parameters.n_frames,1,2));
                    app.RealPartialExportXStart.Value = pos(1);
                    app.RealPartialExportYStart.Value = pos(2);
                    app.RealPartialExportX.Value = pos(3);
                    app.RealPartialExportY.Value = pos(4);

            end

            debug_toc(app, event, "", debug_time)
        end

        % Value changed function: ReverseDiffractionX, 
        % ...and 7 other components
        function axis_direction_callbacks(app, event)
            % Function called when the user modifies the axis orientation
            % in diffraction or real space
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % Function to flip/rotate image axes
            debug_time = tic;

            % Space, "Real" or "Diffraction"
            space = event.Source.Tag;
            
            % For axis direction
            axis_direction = ["normal" "reverse"];
            
            % Get X/Y-axis direction and rotation options of diffraction/real-space
            reverse_x = struct('Diffraction', app.ReverseDiffractionX.Value, 'Real', app.ReverseRealX.Value);
            reverse_y = struct('Diffraction', app.ReverseDiffractionY.Value, 'Real', app.ReverseRealY.Value);
            rotate_view = struct('Diffraction', app.RotateDiffraction.Value, 'Real', app.RotateReal.Value);
            
            % Set axis directions and rotations of either diffraction or real-space images
            set(app.ui_groups.(lower(space)+"_axes"), ...
                "XDir", axis_direction(reverse_x.(space)+1), ...
                "YDir", axis_direction(reverse_y.(space)+1), ...
                'View', [rotate_view.(space), 90])

            % set state button icon color based on value
            for state_button = [app.ReverseDiffractionY, ...
                                app.ReverseDiffractionX, ...
                                app.ShowDiffractionAxes, ...
                                app.ReverseRealY, ...
                                app.ReverseRealX, ...
                                app.ShowRealAxes]
                change_icon_background(app, state_button)
            end

            % Sync ColorWheel with real-space axes direction
            if space == "Real"
                set(app.image_axes.ColorWheel, ...
                    {"XDir" "YDir" 'View'}, ...
                    get(app.image_axes.Real,{"XDir" "YDir" 'View'}));
            end
            
            % X/Y labels of axis annotations
            labels = struct('x', struct('Diffraction', "kx",'Real', "rx"), ...
                            'y', struct('Diffraction', "ky",'Real', "ry"));
            
            % Update axis annotations
            arrayfun(@(x) draw_axis_direction(app, x, space), app.ui_groups.(lower(space)+"_id"));

            debug_toc(app, event, "", debug_time)

            function draw_axis_direction(app, id, space)
                % Internal function to draw the axis annotations; relies on
                % global variables (`labels`, `reverse_x`, `reverse_y`, and
                % `rotate_view`) from `axis_direction_callbacks`
                %
                % Parameters:
                %    app (Quant4D)
                %    id (str): figure/axes/image id
                %    space (str): "Diffraction" or "Real" for the given `id`
                %
                % Returns:
                %    None
            
                fig = app.figures.(id);
                
                % Colors of X/Y axes
                color_x = "r";
                color_y = 'g';
                
                % Draw annotations on `figure`
                % delete(findall(fig,'-depth',2, "Tag",'AxeDir')) % Always delete old and draw new annotations
                if isempty(findall(fig,'-depth',2, "Tag",'AxeDir')) || ~isfield(fig.UserData, 'axis_annotation')
                    fig.UserData.axis_annotation = [];
                
                    % Draw scan directions on Diffraction images
                    if space == "Diffraction"
                        draw_axis_direction(app, id, "Real");
                    end
                
                    x_arrow = annotation(fig, "arrow");
                    x_text = annotation(fig, "textbox", "String", labels.x.(space));
                    y_arrow = annotation(fig, "arrow");
                    y_text = annotation(fig, "textbox", "String", labels.y.(space));
                
                    set([x_arrow, y_arrow], ...
                        "LineWidth", 1, ...
                        "HeadLength", 3, ...
                        "HeadWidth", 3, ...
                        "HeadStyle", "plain")
                
                    set([x_text, y_text], ...
                        "FontWeight", "bold", ...
                        "HorizontalAlignment", "center", ...
                        "VerticalAlignment", "middle")
                
                    set([x_arrow; y_arrow; x_text; y_text], ...
                        'Units', "pixels", ...
                        "PickableParts", "no", ...
                        "Tag", "AxeDir", ....
                        {"Color"}, {color_x; color_y; color_x; color_y})
                    
                    % Scan direction annotation at 5:8 for "Diffraction"
                    fig.UserData.axis_annotation = [x_arrow; y_arrow; x_text; y_text; fig.UserData.axis_annotation];
                    uistack(fig.UserData.axis_annotation,'bottom')
                end
                
                % Set annotation positions/directions
                %  `l`/`t`: length for arrow/total;
                %  `xy`: [arrow origin, arrow X, arrow Y, label X, label Y] positions
                l = 4;
                t = 12;
                xy = [-t -t; l -t; -t l; t -t; -t t];
                
                % Offset from bottom-left
                offset = 22;
                
                % X/Y flip
                xy_flip = 1 - [reverse_x.(space), reverse_y.(space)]*2;
                
                % Axes rotation (clockwise)
                R = rotation_matrix(app, -rotate_view.(space));
                
                update_annotation_positions(fig.UserData.axis_annotation(1:4), offset*[1 1], xy.*xy_flip*R)
                set(fig.UserData.axis_annotation(1:4), "Visible",app.("Show"+space+"Axes").Value)
                
                % Set scan directions on Diffraction patterns
                if space == "Diffraction"
                    l = 1;
                    t = 9;
                    xy = [-t -t; l -t; -t l; t -t; -t t];
                    Rscan = rotation_matrix(app, app.ScanDirectionSlider.Value);
                    scan_flip_y = 1 - 2*[0 app.FlipScanDirectionY.Value];
                    update_annotation_positions(fig.UserData.axis_annotation(5:end), offset*[2.8 1], xy.*scan_flip_y*Rscan.*xy_flip*R)
                
                    % Warning color if scan directions not aligned
                    if ~isfield(app.common_parameters,'scan_direction_initialized') || ~app.common_parameters.scan_direction_initialized
                        color_x = app.sys_constants.warning_color;
                        color_y = color_x;
                    end
                
                    % Only visible when:
                    % 1) show Diffraction annotation AND
                    % 2) not during scan direction alignment AND
                    % 3) in CoM/DPC modes
                    set(fig.UserData.axis_annotation(5:8), ...
                        {"Color"}, {color_x;color_y;color_x;color_y}, ...
                        "Visible", app.ShowDiffractionAxes.Value && ...
                        ~app.ScanDirectionLock.Value && ...
                        any(app.Mode.Value == ["CoM" "DPC"]))
                end
            
                function update_annotation_positions(annotation_group, annot_offset, annot_xy)
                    % Function to update annotation positions
                    %
                    % Parameters:
                    %    annotation_group (4,1) graphics_array: group of arrow and textbox annotations for scan/diffraction direction annotations
                    %    annotation_offset (1,2) float: offset from bottom left corner of the figure
                    %    annotation_xy (5,2) int: [arrow origin, arrow X, arrow Y, label X, label Y] positions
                    %
                    % Returns:
                    %    None

                    % Arrow position: [ Origin XY, Vector XY ];
                    arrow_position_x = [annot_offset + annot_xy(1,:), annot_xy(2,:) - annot_xy(1,:)];
                    arrow_position_y = [annot_offset + annot_xy(1,:), annot_xy(3,:) - annot_xy(1,:)];

                    % Label position: [ Center XY, width, height ]
                    arrow_label_x = [annot_offset + annot_xy(4,:), 0, 0];
                    arrow_label_y = [annot_offset + annot_xy(5,:), 0, 0];

                    % update annotation positions
                    set(annotation_group, ...
                        {"Position"}, ...
                        {arrow_position_x; ...
                         arrow_position_y; ...
                         arrow_label_x; ...
                         arrow_label_y})
                end

            end
        end

        % Callback function: DispColorMap, DispColorMapInvert, 
        % ...and 24 other components
        function display_callbacks(app, event)
            % Function to update all aspects of the image display,
            % including brightness, contrast, gamma, colormap, histogram,
            % vector field, and mask opacity.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None
            
            debug_time = tic;
            
            id = app.DisplayImage.Value;
            user_data = app.image_axes.(id).UserData;
            source = event.Source;

            % Initial contrast will be set as the total range of min:max
            % A change in contrast will expand or contract the width of the range
            % Initial brightness will be also set as the total range of min:max
            % A change in brightness will result in shift of the range up or down
            % Initial gamma is set to 1
            % A change in gamma will result in a power law change in contrast I' = I^gamma
            switch source
                case app.HistogramLog 
                    % set state button icon color based on value
                    change_icon_background(app, app.HistogramLog)

                    % Log-scale option of histogram
                    if app.HistogramLog.Value
                        app.HistogramAxes.YScale = 'log';
                    else
                        app.HistogramAxes.YScale = 'linear';
                    end

                case app.DisplayLock
                    % Lock "current" image
                    % set state button icon color based on value
                    change_icon_background(app, app.DisplayLock)
                    app.DisplayImage.BackgroundColor = app.DisplayTab.BackgroundColor;

                case app.DisplayVectorField
                    % Vector field
                    user_data.vector_field = event.Value;

                case app.DisplayVectorColor
                    % Vector field color
                    color = uisetcolor(user_data.vector_color);

                    % Early return if canceled
                    if isequal(color, 0)
                        return;
                    end
                    user_data.vector_color = color;

                case app.DispColorMap
                    % Colormap
                    user_data.colormap = event.Value;
                    cmap = str2func(user_data.colormap);
                    cm = cmap();
                    
                    % Whether to invert colormap
                    if user_data.invert
                        cm = flipud(cmap());
                    end
                    colormap(app.image_axes.(id), cm)
                
                case app.DispColorMapInvert
                    % set state button icon color based on value
                    change_icon_background(app, app.DispColorMapInvert)

                    % Invert colormap
                    user_data.invert = event.Value;
                    cmap = str2func(user_data.colormap);
                    cm = cmap();
                    
                    % Whether to invert colormap
                    if user_data.invert
                        cm = flipud(cmap());
                    end
                    colormap(app.image_axes.(id), cm)
                
                case app.DisplayBrightnessReset
                    % Reset brightness
                    user_data.brightness = 50;
                
                case app.DisplayContrastReset
                    % Reset contrast
                    user_data.contrast = 50;
                
                case app.DisplayGammaReset
                    % Reset gamma
                    user_data.gamma = 1;
                
                case {app.DisplayBrightnessSpinner, app.DisplayBrightness}
                    % Brightness
                    user_data.brightness = event.Value;
                
                case {app.DisplayContrastSpinner, app.DisplayContrast}
                    % Contrast
                    user_data.contrast = event.Value;
                
                case {app.DisplayGamma, app.DisplayGammaSpinner}
                    % Gamma
                    user_data.gamma = event.Value;
                
                case {app.DisplayMaskOpacitySlider, app.DisplayMaskOpacitySpinner}
                    % Mask opacity
                    user_data.mask_opacity = event.Value;
                
                otherwise   % e.g. app.DisplayImage
                    % Bring selected image to front, unless the selection came from
                    % activating that window (see clicked_window)
                    if ~(isfield(app.tmp_variables, "selected_by_activation") && app.tmp_variables.selected_by_activation)
                        figure(app.figures.(id))
                    end
                    
                    % Update GUIs by values stored in `app.image_axes.(id).UserData` for the current selected image
                    set([app.DisplayVectorField; ...
                         app.DispColorMap; ...
                         app.DispColorMapInvert], ...
                        {"Value"}, ...
                        {user_data.vector_field; ...
                         user_data.colormap; ...
                         user_data.invert})

                    app.DisplayVectorColor.BackgroundColor = user_data.vector_color;
                    
                    % Enable vector field UIs if: 1) in CoM/DPC mode AND 2) real-space image selected
                    set([app.DisplayVectorField; ...
                         app.DispVecFieldLabel; ...
                         app.DisplayVectorColor], ...
                        "Enable", ismember(app.Mode.Value, ["CoM" "DPC"]) && user_data.space == "Real")
                    
                    % Disable brightness/contrast/colormap UIs if: (CoM/DPC) "Phase" and "ColorWheel for Phase" images
                    set([findobj(app.DispContrastsGrid.Children,'-not',"type",'uibutton'); ...
                         app.DispColorMap;app.DispColorMapInvert], ...
                        "Enable", ~contains(user_data.name, "Phase"));
                    
                    % Disable mask opacity UIs if: ColorWheel/Mask/Preview images selected
                    set([app.ShowMaskWindow; ...
                         app.DisplayMaskOpacitySpinner; ...
                         app.DisplayMaskOpacitySlider], ...
                        "Enable", user_data.space ~= "ColorWheel" && ~ismember(user_data.type, ["Mask" "Preview"]))
            end

            % Update UI
            set_external_source(app, event,[app.DisplayBrightnessSpinner, app.DisplayBrightness], "Value",user_data.brightness)
            set_external_source(app, event,[app.DisplayContrastSpinner, app.DisplayContrast], "Value",user_data.contrast)
            set_external_source(app, event,[app.DisplayGammaSpinner, app.DisplayGamma], "Value",user_data.gamma)
            set_external_source(app, event,[app.DisplayMaskOpacitySpinner, app.DisplayMaskOpacitySlider], "Value",user_data.mask_opacity)

            % Update properties stored by the `axes`
            app.image_axes.(id).UserData = user_data;
            
            % Re-plot image
            plot_image(app, event, id);

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: RealROIFrameX, RealROIFrameX, RealROIFrameY, 
        % ...and 3 other components
        function realspace_ROI_callbacks(app, event)
            % Function to update the real space ROI based on the selected
            % type and location from the main UI, as well as to update the
            % diffraction pattern accordingly. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            switch event.Source
                case app.UpdateImages
                    % Draw ROI if doesn't yet exist and update
                    % diffraction image
                    if isempty(findobj(app.ui_groups.real_axes, "Tag","Real-space ROI"))
                        mock_UI_callbacks(app, app.RealROIShape)
                    else
                        move_real_ROI(app, app.annotations.RealROI.Real, event)
                    end
                
                case app.RealROIShape
                    roi_type = app.RealROIShape.Value;
                    if roi_type == "file"
                        app.images.RealROIFile = import_mask(app, "Real");
                        
                        % if ROI import from file is canceled, revert 
                        if isempty(app.images.RealROIFile)
                            roi_type = "full";
                        end
                    end

                    % Update GUI if changed programmatically
                    app.RealROIShape.Value = roi_type;

                    % Panel enable/disable
                    set([app.RealROIGrid.Children; ...
                         app.RealROIFrameLabel], ...
                        "Enable", roi_type == "point")

                    % Allow for inversion of the ROI if not full field
                    app.RealROIInvert.Enable = roi_type ~= "full";
                    
                    % If disabled, then set to off
                    app.RealROIInvert.Value = app.RealROIInvert.Value && ...
                                              app.RealROIInvert.Enable;
                    
                    % Draw ROIs
                    draw_real_ROI(app, event, roi_type);
                
                case {app.RealROIFrameX, app.RealROIFrameY}
                    % move the real space ROI according to user input
                    % on frame (x,y) spinners
                    move_real_ROI(app, event.Source, event)
                
                otherwise

                    % set state button icon color based on value
                    change_icon_background(app, app.RealROIInvert)
                        
                    % run the listener to update any/all other ROIs and
                    % the diffraction pattern
                    move_real_ROI(app, app.annotations.RealROI.Real, event)
            end

            debug_toc(app, event, "", debug_time)
        end

        % Value changed function: Mode
        function detector_mode_callbacks(app, event)
            % Function called when the mode changes, either by the user or
            % programmatically (i.e. Preview -> Alignment, or between any
            % of the available imaging modes). 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            dmod = app.Mode.Value;

            % Enable windows
            enable_windows(app,false)
            
            % Clear ROIs on Diffraction
            clear_detectors(app);

            % Clear Real-space images if not switching to alignment or preview
            if ~ismember(dmod, ["Alignment" "Preview"])
                delete(findobj(app.ui_groups.real_axes(~contains({app.ui_groups.real_axes.Tag}, "Mask")),'Type','image'));
            end

            % Enable/Disable CoM/DPC related UI/images/buttons
            set(app.ui_groups.CoM_buttons, ...
                "Enable", any(dmod == ["CoM" "DPC"]));
            
            if ismember(dmod, ["CoM" "DPC"])
                app.DisplayImage.Items = app.ui_groups.image_name;
                app.DisplayImage.ItemsData = app.ui_groups.image_id;

                % Substitute "CoM"/"DPC" in image names, window titles and
                % button texts
                mode_prefix = dmod(1:3);
                app.DisplayImage.Items = replace(app.ui_groups.image_name, ["CoM" "DPC"], mode_prefix);
                set(app.ui_groups.image_figures, {"Name"},cellstr(app.DisplayImage.Items)')
                set(app.ui_groups.CoM_buttons, {"Text"}, cellstr(replace(get(app.ui_groups.CoM_buttons, "Text"), ["CoM" "DPC"], mode_prefix)))
            
                % show Windows tab in the Settings UI when in DPC/CoM
                app.SettingsTabGroup.SelectedTab = app.WindowsTab;
                
            else
                % Image dropdown texts
                app.DisplayImage.Items = app.ui_groups.image_name(app.ui_groups.image_type ~= "CoM");
                
                % Image dropdown values
                app.DisplayImage.ItemsData = app.ui_groups.image_id(app.ui_groups.image_type ~= "CoM");
                
                % Image windows
                set(app.ui_groups.image_figures(app.ui_groups.image_type == "CoM"), "Visible", "off")

                % show Display tab in the Settings UI when not in DPC/CoM
                app.SettingsTabGroup.SelectedTab = app.DisplayTab;
            end

            % Show primary diffraction/real-space image when mode changes unless in Preview mode
            set([app.figures.Diffraction; app.figures.Real], "Visible", dmod ~= "Preview")
            
            % Special case for Import Preview Mode
            if dmod == "Preview"
                % Keep only "Preview" image
                app.DisplayImage.Items = "Preview";
                app.DisplayImage.ItemsData = "Preview";
                
                % Hide other UIs
                set([app.MiscTab, ...
                     app.InfoTab, ...
                     app.ExportDatasetTab], ...
                    "Parent", [])

                set([app.figures.Import, ...
                     app.figures.Preview, ...
                     app.figures.Settings], ...
                    "Visible", "on")
            else
                % Note current mode
                app.common_parameters.detector_mode = app.Mode.Value;
                
                % Remove "Preview" image
                preview_index = app.DisplayImage.ItemsData == "Preview";
                app.DisplayImage.Items(preview_index) = [];
                app.DisplayImage.ItemsData(preview_index) = [];
                app.figures.Preview.Visible = "off";
                
                % Show all UIs
                set([app.MiscTab, ...
                     app.InfoTab], ...
                    "Parent", app.SettingsTabGroup)

                set(app.ExportDatasetTab, "Parent", app.SaveTabGroup)
            end

            % Define images in the saving list
            app.SaveImageList.Items = app.DisplayImage.ItemsData;
            app.SaveImageList.ItemsData = app.SaveImageList.Items;
            
            % Update Image saving prefix
            mock_UI_callbacks(app, app.SaveImagePrefix)
            
            % Update diffraction axis annotations
            mock_UI_callbacks(app, app.ShowDiffractionAxes)

            % Set detector size when transmitted beam is aligned the first time
            if isfield(app.common_parameters,'transmitted_beam_init') && ...
               ~app.common_parameters.transmitted_beam_init && ...
               dmod ~= "Alignment"
                set([app.InnerAnnularRadius; ...
                     app.OuterAnnularRadius; ...
                     app.VirtualApertureR], ...
                    {"Value"}, ...
                    {app.TransBeamR.Value; ...
                     (app.TransBeamR.Value + app.common_parameters.max_radius)/3; ...
                     app.TransBeamR.Value})
                app.common_parameters.virtual_aperture_center = app.center;
                app.common_parameters.transmitted_beam_init = true;
            end

            % Diffraction detector UI
            set(app.ui_groups.detector_ui, "Visible", "off");
            
            % Hide Math Tab
            app.MathTab.Parent = [];
            app.RealPanel.Visible = "on";
            
            switch dmod
                case "Preview"
                    app.PreviewGrid.Visible = "on";
                    app.RealPanel.Visible = "off";
                    preview_callbacks(app, event)
                
                case "Alignment"
                    % display annular integration step so the user can
                    % decide before switching to a mode where the
                    % integration occurs automatically (i.e. annular/round,
                    % DPC, or CoM)
                    app.AnnularStepGrid.Parent = app.AlignmentGrid;
                    app.AnnularStepGrid.Layout.Row = 5;
                    app.AnnularStepGrid.Layout.Column = 1;

                    app.AlignmentGrid.Visible = "on";
                    transmitted_beam_callbacks(app, event)
                
                case {"Annular", "CoM", "DPC"}
                    % make sure annular integration step is returned after
                    % alignment mode
                    if app.AnnularStepGrid.Parent ~= app.AnnularDetectorGrid
                        app.AnnularStepGrid.Parent = app.AnnularDetectorGrid;
                        app.AnnularStepGrid.Layout.Row = 5;
                        app.AnnularStepGrid.Layout.Column = 1;
                    end

                    app.AnnularDetectorGrid.Visible = "on";
                    annular_detector_callbacks(app, event)

                    if dmod ~= "Annular" % 'CoM' OR 'DPC'
                        % show scan direction panel
                        app.ScanDirectionPanel.Visible = "on";

                        % if DPC show segmented detector panel, else hide
                        if dmod == "DPC"
                            app.SegmentedDetectorPanel.Visible = "on";
                        else
                            app.SegmentedDetectorPanel.Visible = "off";
                        end

                        % Plot ColorWheel
                        plot_image(app, event, "ColorWheel")
                        
                        % bring ColorWheel and CoM Phase Magnitude to the
                        % front
                        figure(app.figures.CoMPhMag);
                        figure(app.figures.ColorWheel)
                        
                        % Flashing to align scan direction
                        if ~app.common_parameters.scan_direction_initialized
                            flash_background(app, app.ScanDirectionGrid);
                        end
                    
                    else
                        % Hide segmented detector and scan direction panels
                        % if not in DPC or CoM
                        app.SegmentedDetectorPanel.Visible = "off";
                        app.ScanDirectionPanel.Visible = "off";
                    
                    end
                
                case "Virtual"
                    % Show Virtual aperture panel
                    app.VirtualApertureGrid.Visible = "on";
                    virtual_aperture_callbacks(app, event);
                
                case "Custom"
                    % Show custom detector panel
                    app.CustomDetectorGrid.Visible = "on";

                    % Add Math tab to the Settings UI
                    app.MathTab.Parent = app.SettingsTabGroup;

                    custom_detector_callbacks(app, event)
                    
                    % Bring the diffraction mask to the front
                    figure(app.figures.DiffractionMask)
            end

            debug_toc(app, event, "", debug_time)
        end

        % Value changed function: AnnularStep, DetectorCoordinatePosition, 
        % ...and 2 other components
        function detector_coordinates_callbacks(app, event)
            % Function called when the users selects a different coordinate
            % system ("Polar" or "Cartesian"), positioning system
            % ("Relative" or "Absolute"), or unit ("mrad" or "pixels"); as
            % well as if the user changes the annular integration step
            % size.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % "Polar" necessitates "Relative"
            switch event.Source
                case app.DetectorCoordinateSystem
                    if app.DetectorCoordinateSystem.Value == "Polar"
                        app.DetectorCoordinatePosition.Value = "Relative";
                    end
                
                case app.DetectorCoordinatePosition
                    if app.DetectorCoordinatePosition.Value == "Absolute"
                        app.DetectorCoordinateSystem.Value = "Cartesian";
                    end
            end

            % Set diffraction scale based on coordinates used
            if app.DetectorCoordinateUnit.Value == "mrad"
                app.diff_scale = app.mradPx.Value;
            else
                % "pixels" are 1:1
                app.diff_scale = 1;
            end
            
            % Set relative center of the diffraction pattern
            if app.DetectorCoordinatePosition.Value == "Relative"
                app.center_rel = app.center;
            else
                % "Absolute" is relative to 
                app.center_rel = [0 0];
            end
            
            if event.Source == app.AnnularStep && ~strcmp(app.Mode.Value,'Alignment')
                annular_detector_callbacks(app, event)
            end

            % Update UI
            mock_event = struct("Source", app.DetectorCoordinateSystem, ...
                                "EventName", "UpdateCoord");

            switch app.Mode.Value
                case {'Annular' 'DPC' 'CoM'}
                    annular_detector_callbacks(app, mock_event)
                
                case "Virtual"
                    virtual_aperture_callbacks(app, mock_event)
                
                case "Custom"
                    custom_detector_callbacks(app, mock_event)
            end
        end

        % Button pushed function: SwapByteOrder, SwapDiffractionXY, 
        % ...and 1 other component
        function dataset_options_callbacks(app, event)
            % Function called when the user request a swap of data byte
            % ordering (i.e. big endian -> little endian), real space x,y
            % (i.e. [kx, ky, rx, ry] -> [kx, ky, ry, rx]), or diffraction
            % space x,y (i.e. [kx, ky, rx, ry] -> [ky, kx, rx, ry]).
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch event.Source
                case app.SwapByteOrder % Swap byte-order
                    message = "Swapping byte order ...";
                    app.tmp_variables.progress_dialog = progress_dialog(app, sprintf("\n%s\n",message), "Byte Order Swap");

                    try
                        app.data = swapbytes(app.data);
                    catch
                        if app.dataset_parameters.gpu
                            waitbar(0,app.tmp_variables.progress_dialog,message+sprintf("\nIt seems GPU has not enough memory.\nUsing CPU for this process ..."))
                            app.data = gather(app.data);
                            app.data = swapbytes(app.data);
                            app.data = gpuArray(app.data);
                        else
                            delete(app.tmp_variables.progress_dialog)
                            notification_dialog(app, "error", "It seems the system has not enough memory for this process! " + ...
                                "Maybe try to increase system's virtual memory.", "Out of Memory")
                            return
                        end
                    end
                    
                    % update data info at `app.dataset_parameters.byte_orer`
                    bo = struct("l", "b", "b", "l");
                    app.dataset_parameters.byte_orer = bo.(app.dataset_parameters.byte_orer);
                    
                    app.DatasetInfo.Value = get_import_info(app);
                    
                    mock_UI_callbacks(app, app.UpdateImages)
                    
                    delete(app.tmp_variables.progress_dialog)
                    selection = notification_dialog(app,'quest', "Is the current byte-order correct?",'Byte Order Swap',["Yes", "No. Revert"]);
                    
                    % Run the process again if selected "No ....."
                    if startsWith(selection, "No")
                        dataset_options_callbacks(app,struct("Source",app.SwapByteOrder,"EventName", ""))
                    end

                case {app.SwapDiffractionXY app.SwapRealXY}
                    % Diffraction or real-space
                    if event.Source.Tag == "Diffraction"
                        unit = "pixels";
                    else
                        % Delete all Real-space ROIs;
                        unit = "frames";
                        delete(findobj(app.ui_groups.real_axes, "Tag",'Real-space ROI'));
                        app.common_parameters.transmitted_beam_init = true;
                    end

                    % Swap X/Y dimensions
                    n = [app.dataset_parameters.n_pixels, app.dataset_parameters.n_frames];
                    if unit == "pixels"
                        order = [2 1 3 4];
                    else
                        order = [1 2 4 3];
                    end
                    
                    app.data = reshape(permute(reshape(app.data, n), order), prod(n(order(1:2))), []);
                    
                    for f = "n_" + unit + ["", "_total"]
                        app.dataset_parameters.(f) = fliplr(app.dataset_parameters.(f));
                    end
                    
                    app.dataset_parameters.(unit + "_start") = fliplr(app.dataset_parameters.(unit + "_start"));
                    
                    % Re-prepare the imported data
                    import_callbacks(app, event)
                    app.DatasetInfo.Value = get_import_info(app);

                case app.PreviewButton
                    % Check data NaN/Inf, without asking to sway byte-order
                    selection = check_NaN(app, app.images.Preview, true);

                    if strcmp(selection,'Set NaNs to 0')
                        app.data(isnan(app.data(:)))=0;
                    end

                otherwise
                    app.DatasetInfo.Value = get_import_info(app);
                    
                    % Check data NaN/Inf, ask whether to sway byte-order
                    selection = check_NaN(app, app.images.Diffraction, false);
                    if strcmp(selection,'Set NaNs to 0')
                        app.data(isnan(app.data(:)))=0;
                    end

            end
        end

        % Callback function: PreviewButton, PreviewFrameX, PreviewFrameY, 
        % ...and 9 other components
        function preview_callbacks(app, event)
            % Function called when the user request to preview a
            % diffraction pattern before importing.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch event.Source
                case app.Mode % Entering mode
                    cla(app.image_axes.Preview);
                    
                    % Clear previous preview
                    app.images.Preview = [];
                    
                    % Enable windows
                    enable_windows(app,true)

                case app.UpdateImages % Update image
                    % Preview
                    mock_UI_callbacks(app, app.PreviewButton)

                case {app.PreviewFrameX app.PreviewFrameY} % Preview Frame X/Y
                    % Force Frame X/Y minimum as 1
                    event.Source.Value = max(event.Value, 1);
                    
                    % Preview
                    mock_UI_callbacks(app, app.PreviewButton)

                case {app.PreviewFrame_1_1;  app.PreviewFrame_X2_1;  app.PreviewFrame_X_1; % Preview location buttons
                      app.PreviewFrame_1_Y2; app.PreviewFrame_X2_Y2; app.PreviewFrame_X_Y2;
                      app.PreviewFrame_1_Y;  app.PreviewFrame_X2_Y;  app.PreviewFrame_X_Y}
                    
                    % Get limits from Frame X/Y UIs
                    X = app.PreviewFrameX.Limits(2);
                    Y = app.PreviewFrameY.Limits(2);

                    % Evaluate the text on buttons (i.e. [X/2, Y])
                    xy = min(ceil(eval(event.Source.Text)), [X Y]);
                    
                    % Set values of Frame X/Y UIs
                    set([app.PreviewFrameX, app.PreviewFrameY], ...
                        {"Value"}, ...
                        {xy(1); xy(2)});
                    
                    % Preview
                    mock_UI_callbacks(app, app.PreviewButton)

                case app.PreviewButton
                    cla(app.image_axes.Preview);
                    
                    % Get parameters
                    import_callbacks(app, event);
                    params = app.tmp_variables.Preview;
                    frame_x = app.PreviewFrameX.Value-1;
                    frame_y = app.PreviewFrameY.Value-1;

                    if ~isempty(params)
                        n_pixels = params.n_pixels_total;
                        n_frames = params.n_frames_total;

                        try
                            if ~isempty(params.h5ds) % Preview HDF5
                                frame = quant4d.readHDF5(params.file_path, params.h5ds, ...
                                    ScanSize = params.n_frames_total, ...
                                    PixelStart = params.pixels_start, NumPixels = params.n_pixels, ...
                                    Binning = params.pixels_binning, ...
                                    FrameStart = [frame_x, frame_y] + 1, NumFrames = [1 1]);
                            else % Preview others
                                [frame, err] = preview_frame(app, [frame_x, frame_y] + 1);
                                if err == -1
                                    error("Quant4D:preview", "Could not read the preview frame.");
                                end
                            end

                            % the readers return single/double, (kx, ky, 1, 1)
                            frame = frame(:, :, 1, 1);

                            app.common_parameters.PreviewAxLim = [0.51, size(frame, 1) + .49, 0.51, size(frame, 2) + .49];
                            set(app.image_axes.Preview, ...
                                "XLim", app.common_parameters.PreviewAxLim(1:2), ...
                                "YLim", app.common_parameters.PreviewAxLim(3:4));

                            app.images.Preview = frame;

                            % Plot image
                            plot_image(app, event, "Preview")

                            % Check NaN
                            dataset_options_callbacks(app, event)

                        catch
                            notification_dialog(app, ...
                                                "error", ...
                                                "Errors occurred during preview! Maybe reached end-of-file.", ...
                                                "Error during Preview!");
                        end
                    end
            end

        end

        % Callback function: Alpha, TBAutoAlign, TBCrossAlign, TransBeamR, 
        % ...and 12 other components
        function transmitted_beam_callbacks(app, event)
            % Function called when the user interacts with UI elements on
            % the `Alignment` tab of the main UI (i.e. convergence angle,
            % transmitted beam x/y/radius, AutoAlign, etc.)
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            switch event.Source
                case app.Mode % Entering mode

                    % Create transmitted beam annotation, allow for disk as large as the entire diffraction pattern
                    app.annotations.TransBeam = drawcircle(app.image_axes.Diffraction, ...
                                                           "Center", app.center, ...
                                                           "Radius", app.TransBeamR.Value, ...
                                                           "Color", "b",...
                                                           "DrawingArea", "unlimited", ...
                                                           "Deletable", false, ...
                                                           "EdgeAlpha", 0.7, ...
                                                           "FaceAlpha", 0, ...
                                                           "Tag", "TransBeamAnnot");
                    app.annotations.TransBeam.UserData.Move = addlistener(app.annotations.TransBeam, "MovingROI", @app.move_transmitted_beam);
                    addlistener(app.annotations.TransBeam, "ROIMoved", @app.move_transmitted_beam);
                    
                    % Select `Diffraction` image
                    mock_UI_callbacks(app, app.DisplayImage, "Diffraction");
                    
                    % If this is the initializing alignment, then do swap byte check and auto-align
                    if ~app.common_parameters.transmitted_beam_init
                        dataset_options_callbacks(app, event);
                        auto_align(app);
                    end

                    % Enable windows
                    enable_windows(app,true)
                
                case app.UpdateImages
                    % Update images
                    % Create a summed image of all diffraction patterns simply for alignment and calibration
                    app.images.DiffractionMask = ones(app.dataset_parameters.n_pixels, app.dataset_parameters.data_type);
                    app.images.Real = gather(reshape(reshape(app.images.DiffractionMask,1,[])*app.data, app.dataset_parameters.n_frames));
                
                case app.TBAutoAlign
                    % Auto-align
                    auto_align(app);
                
                case app.TBCrossAlign
                    % Align transmitted beam via two crossed lines
                    cross_align(app);
            end
            % Update dependent variables
            move_transmitted_beam(app, event.Source, event);

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: AnnularRadiusLink, AutoCurl, 
        % ...and 20 other components
        function annular_detector_callbacks(app, event)
            % Function called when the user interacts with UI elements on
            % the `Annular/Round`, `Segmented (DPC)`, and `Center of Mass`
            % tabs of the main UI (i.e. inner/outer annular angles,
            % segmented detector controls, scan direction alignment, etc.)
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;
            
            % Absolute pixel coordinates of central beam; only changes in
            % `transmitted_beam_callbacks()`
            transmitted_beam_center = app.center;
            
            % Detector mode; when changed this callback will be called
            dmod = app.Mode.Value;

            % set state button icon color based on value
            change_icon_background(app, app.FlipScanDirectionY)
            change_icon_background(app, app.AnnularRadiusLink)

            switch event.Source
                case app.DetectorCoordinateSystem % Change coordinate options
                    % set UI limits
                    limitAnnUI()

                case {app.Mode, app.AnnularStep} % Entering current mode
                    % set UI limits
                    limitAnnUI()

                    % Lock scan directions first upon entering annular modes
                    app.ScanDirectionLock.Value = false;
                    
                    % UI enable/disable
                    enableAnnUI()
                    
                    % Update annular integral mask
                    integrate_annular()
                    
                    % Draw detectors
                    draw_annular_detector();

                    % Draw segmented detectors if in DPC mode
                    if dmod == "DPC"
                        draw_segmented_detector();
                    end
                    
                    % Update UI/ROIs
                    move_annular_detector(event.Source, event)
                    
                    % Enable windows
                    enable_windows(app,true)

                case {app.InnerAnnularRadius app.InnerAnnularRadiusSpinner ...
                      app.OuterAnnularRadius app.OuterAnnularRadiusSpinner ...
                      app.DetectorRotationSlider app.DetectorRotationSpinner ...
                      app.ScanDirectionSlider app.ScanDirectionSpinner ...
                      app.AnnularRadiusLink app.NSeg app.NRung ...
                      app.FlipScanDirectionY app.UpdateImages}
                    % Update UI/ROIs
                    move_annular_detector(event.Source, event)

                case app.ScanDirectionLock
                    if app.ScanDirectionLock.Value
                        app.ScanDirectionLock.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'unlock.png'); 
                    else
                        app.ScanDirectionLock.Icon = fullfile(fileparts(mfilename('fullpath')), 'icons', 'lock.png');
                    end

                    % Flag scan directions as aligned
                    app.common_parameters.scan_direction_initialized = true;
                    
                    % Enable/Disable GUI elements
                    enableAnnUI()
                    
                    % Try to remove existing scan direction ROIs
                    delete(findobj(app.image_axes.Diffraction, "Tag",'ScanDirAnnot'));
                    
                    % Draw annotations
                    if app.ScanDirectionLock.Value
                        draw_scan_direction();
                    end

                    % Update diffraction axes annotations
                    mock_UI_callbacks(app, app.ShowDiffractionAxes)

                case app.AutoCurl
                    % display a progress dialog for user
                    app.tmp_variables.progress_dialog = progress_dialog(app, sprintf('Automatically estimating scan \norientation by minimizing curl...'), "Auto scan orientation");
                    
                    % find the scan rotation / y flip that makes the CoM field curl-free,
                    % then recompute; see quant4d.minimizeCurl
                    [scan_deg, flip_y] = quant4d.minimizeCurl(app.images.CoMX, app.images.CoMY, ...
                        app.ScanDirectionSlider.Value, app.FlipScanDirectionY.Value);
                    set([app.ScanDirectionSlider app.ScanDirectionSpinner], "Value", scan_deg);
                    app.FlipScanDirectionY.Value = flip_y;
                    move_annular_detector(app.ScanDirectionSlider, ...
                        struct("Source", app.ScanDirectionSlider, "EventName", "ValueChanged", "Value", scan_deg))
                    
                    % automatically close out the scan direction routine
                    app.ScanDirectionLock.Value = false;
                    annular_detector_callbacks(app, struct("Source",app.ScanDirectionLock, "EventName", "ValueChanged", "Value", false, "PreviousValue", true))

                    % Close progress bar and Enable panel objects
                    delete(app.tmp_variables.progress_dialog);
            end

            debug_toc(app, event, "", debug_time)


            %% Sub functions
            % Function to update Annular detector UI limits/labels when coordinate options change
            function limitAnnUI()
                set([app.AnnRi_NFLabel app.AnnRo_NFLabel], ...
                    'Text', ...
                    app.DetectorCoordinateUnit.Value)
                set([app.InnerAnnularRadiusSpinner; ...
                     app.OuterAnnularRadiusSpinner], ...
                    "Limits", ...
                    [0 app.common_parameters.max_radius*app.diff_scale], ...
                    'Step', ...
                    app.AnnularStep.Value)
                inner_radius = clip(round(app.InnerAnnularRadius.Value*app.mradPx.Value/app.AnnularStep.Value)*app.AnnularStep.Value, 0, app.InnerAnnularRadius.Limits(2));
                outer_radius = clip(round(app.OuterAnnularRadius.Value*app.mradPx.Value/app.AnnularStep.Value)*app.AnnularStep.Value, 0, app.OuterAnnularRadius.Limits(2));
                set_external_source(app, event, ...
                                    [app.InnerAnnularRadiusSpinner; ...
                                     app.OuterAnnularRadiusSpinner; ...
                                     app.InnerAnnularRadius; ...
                                     app.OuterAnnularRadius], ...
                                    {"Value"}, ...
                                    {inner_radius; ...
                                     outer_radius; ...
                                     min(inner_radius/app.mradPx.Value, app.common_parameters.max_radius); ...
                                     min(outer_radius/app.mradPx.Value, app.common_parameters.max_radius)}); 
            end

            % Function to enable/disable UI
            function enableAnnUI()
                % Enable segmented panel
                set(app.SegmentedDetectorGrid.Children, "Enable",switch_on_off(app, dmod == "DPC"))

                % Change Enable state of scan direction UIs, except `app.ScanDirectionLock`
                set(setdiff(app.ScanDirectionGrid.Children,app.ScanDirectionLock), ...
                    "Enable", ...
                    switch_on_off(app, app.ScanDirectionLock.Value))

                % enable ScanDirectionLock if in CoM/DPC mode, else disable
                app.ScanDirectionLock.Enable = ismember(dmod, ["CoM" "DPC"]);
                
                % Highlight to align Scanning Direction
                if app.ScanDirectionLock.Enable && ~app.common_parameters.scan_direction_initialized
                    background_color = app.sys_constants.warning_color;
                else
                    background_color = app.sys_constants.background_color;
                end
                
                % Set scan direction panel color
                app.ScanDirectionGrid.BackgroundColor = background_color;
            end

            % Function to live update annular/round/segmented detectors
            function move_annular_detector(source, event)
                inner_radius = app.InnerAnnularRadius.Value;
                outer_radius = app.OuterAnnularRadius.Value;
                detector_rotation = app.DetectorRotationSlider.Value;
                scan_direction = app.ScanDirectionSlider.Value;
                flip_scan_y = 1-2*app.FlipScanDirectionY.Value;

                % Cases for different detectors
                if contains(source.Tag,'AnnDetr')
                    moveAnnR()
                elseif contains(source.Tag,'SegDetr')
                    move_segmented_detector()
                elseif contains(source.Tag,'ScanDir')
                    move_scan()
                else % app.Mode app.UpdateImages
                    moveAnnR();
                    
                    % Update scan directions as well
                    if app.ScanDirectionLock.Value
                        move_scan();
                    end
                end

                % Whether to update images
                if to_update_image(app, event)
                    % Skip calculations of new BF/DF `app.images.Real` if
                    % annular radii are not changed
                    if is_different_to_previous(app,'AnnR',[inner_radius outer_radius]) || is_static_event(app, event)
                        % rings wholly inside [inner, outer): the image equals the mask (H1)
                        k = quant4d.binRange(app.common_parameters.annular_edges, inner_radius, outer_radius);
                        mask_ann = reshape(any(app.masks.annular_bins(k, :), 1), app.dataset_parameters.n_pixels);
                        app.images.DiffractionMask = mask_ann;
                        app.masks.annular = mask_ann;
                        app.images.Real = gather(sum(app.images.annular_images(:, :, k), 3, 'omitnan'));
                    end

                    % CoM/DPC calculations; skip if parameters unchanged
                    if ismember(dmod, ["CoM", "DPC"])
                        if is_different_to_previous(app,'CoM_P',[inner_radius outer_radius scan_direction flip_scan_y detector_rotation]) || is_static_event(app, event)
                            calculate_CoM();
                        end
                    end
                    % Update images
                    plot_all_patterns(app, event)
                end

                % Sub sub functions
                % Sub sub function for annular radii
                function moveAnnR()
                    scale = app.diff_scale;
                    
                    % given the AnnularStep (in mrad), round detector step
                    % size (in pixels)
                    annular_pixel_step = app.AnnularStep.Value/app.mradPx.Value;

                    switch source
                        case app.annotations.inner_annulus
                            inner_radius = round(event.CurrentRadius/annular_pixel_step) * annular_pixel_step;
                        case app.annotations.outer_annulus
                            outer_radius = round(event.CurrentRadius/annular_pixel_step) * annular_pixel_step;
                        case app.InnerAnnularRadius
                            inner_radius = round(event.Value/annular_pixel_step) * annular_pixel_step;
                        case app.OuterAnnularRadius
                            outer_radius = round(event.Value/annular_pixel_step) * annular_pixel_step;
                        case app.InnerAnnularRadiusSpinner
                            inner_radius = round(event.Value/app.AnnularStep.Value)*app.AnnularStep.Value/app.diff_scale;
                        case app.OuterAnnularRadiusSpinner
                            outer_radius = round(event.Value/app.AnnularStep.Value)*app.AnnularStep.Value/app.diff_scale;
                        otherwise % {app.AnnularRadiusLink, app.Mode app.UpdateImages}
                            app.common_parameters.detector_width = outer_radius - inner_radius;
                    end

                    % If inner/outer detector radii are linked
                    if app.AnnularRadiusLink.Value
                        detector_width = app.common_parameters.detector_width;
                        if contains(source.Tag,'RI')
                            inner_radius = min(inner_radius, app.common_parameters.max_radius-detector_width);
                            outer_radius = inner_radius + detector_width;
                        elseif contains(source.Tag,'RO')
                            outer_radius = max(outer_radius, detector_width);
                            inner_radius = outer_radius - detector_width;
                        end
                    end
                    
                    % Restrict Inner/Outer radii
                    if contains(source.Tag,'RI')
                        inner_radius = clip(inner_radius, 0, outer_radius);
                    elseif contains(source.Tag,'RO')
                        outer_radius = clip(outer_radius, inner_radius, app.common_parameters.max_radius);
                    end
                    
                    % Update ROI
                    set([app.annotations.inner_annulus;app.annotations.outer_annulus], ...
                        {'Radius'}, {inner_radius;outer_radius})
                    
                    % Update UI with Limits check
                    set_external_source(app, event, ...
                                        [app.InnerAnnularRadius; ...
                                         app.OuterAnnularRadius; ...
                                         app.InnerAnnularRadiusSpinner; ...
                                         app.OuterAnnularRadiusSpinner], ...
                                        {"Value"}, ...
                                        {inner_radius; ...
                                         outer_radius; ...
                                         min(inner_radius*scale, app.common_parameters.max_radius*scale); ...
                                         min(outer_radius*scale, app.common_parameters.max_radius*scale)});
                    
                    % Update saving prefix
                    if is_static_event(app, event)
                        mock_UI_callbacks(app, app.SaveImagePrefix)
                    end

                    % Whether to update segments as well
                    if dmod == "DPC"
                        move_segmented_detector();
                    end
                end

                % Sub sub function for segmented detector
                function move_segmented_detector()
                    switch source
                        case {app.DetectorRotationSlider app.DetectorRotationSpinner}
                            detector_rotation = event.Value;
                        case app.annotations.SegDetrP0
                            rxy = (event.CurrentPosition-transmitted_beam_center);
                            detector_rotation = atan2d(rxy(2), rxy(1));
                        case {app.NSeg app.NRung}
                            draw_segmented_detector();
                    end

                    % Update UI
                    set_external_source(app, event, [app.DetectorRotationSlider, app.DetectorRotationSpinner], "Value",detector_rotation)
                    
                    % Update ROI
                    pos0 = [inner_radius, 0; outer_radius, 0; (inner_radius+outer_radius)/2, 0]*rotation_matrix(app, detector_rotation)+transmitted_beam_center;
                    set([app.annotations.SegDetrL0 app.annotations.SegDetrP0],{"Position"},{pos0(1:2,:);pos0(3,:)});
                    set(app.annotations.segmented_detector_circle,{'Radius'}, num2cell((1:app.NRung.Value-1)'/app.NRung.Value*(outer_radius - inner_radius) + inner_radius))
                    
                    % Use 3D matrix for positions, then put the 1st/2nd dimensions (2x2 array) in each cell for each segment
                    t = detector_rotation+360*(reshape(1:app.NSeg.Value,1,1,[])-.5)/app.NSeg.Value;
                    set(app.annotations.segmented_detector_line,{"Position"},squeeze(num2cell([inner_radius;outer_radius].*[cosd(t) sind(t)]+transmitted_beam_center, 1:2)))
                end

                % Sub sub function for scan directions
                function move_scan()
                    % Use polar relative pixel coordinates for calculation
                    svx = app.annotations.ScanDir.xc.Center - transmitted_beam_center;
                    svy = app.annotations.ScanDir.yc.Center - transmitted_beam_center;

                    switch source
                        case app.annotations.ScanDir.xc
                            svx = event.CurrentCenter - transmitted_beam_center;
                            scan_direction = atan2d(svx(2), svx(1));
                        case app.annotations.ScanDir.yc
                            svy = (event.CurrentCenter - transmitted_beam_center)*flip_scan_y;
                            scan_direction = -atan2d(svy(1), svy(2));
                        case {app.ScanDirectionSlider app.ScanDirectionSpinner}
                            scan_direction = event.Value;
                        case app.FlipScanDirectionY
                    end

                    % Convert back to Cartesian absolute pixel coordinates for annotations
                    [x1,y1] = pol2cart(deg2rad(scan_direction), sqrt(sum(svx.^2)));
                    sp1 = [x1 y1] + transmitted_beam_center;
                    [x2,y2] = pol2cart(deg2rad(scan_direction+90*flip_scan_y), sqrt(sum(svy.^2)));
                    sp2 = [x2 y2] + transmitted_beam_center;
                    
                    % Not limiting annotation positions
                    set([app.annotations.ScanDir.xl app.annotations.ScanDir.yl],{"Position"},{[transmitted_beam_center;sp1];[transmitted_beam_center;sp2]})
                    set_external_source(app, event, [app.annotations.ScanDir.xc, app.annotations.ScanDir.yc],{"Center"},{sp1;sp2})
                    set_external_source(app, event, [app.ScanDirectionSlider, app.ScanDirectionSpinner], "Value",scan_direction)
                end
            end

            % Function to draw annular/round/segmented detectors
            function draw_annular_detector()
                % delete any annular detector annotations
                delete(findobj(app.image_axes.Diffraction,'-regexp', "Tag",'AnnDetrAnnot'))
                
                % draw inner and outer circles
                app.annotations.inner_annulus = drawcircle(app.image_axes.Diffraction, ...
                                                           "Center", transmitted_beam_center, ...
                                                           "Radius", 1, ...
                                                           "Color", "r", ...
                                                           "Tag", "AnnDetrAnnot RI");
                app.annotations.outer_annulus = drawcircle(app.image_axes.Diffraction, ...
                                                           "Center", transmitted_beam_center, ...
                                                           "Radius", 2, ...
                                                           "Color", "m", ...
                                                           "Tag", "AnnDetrAnnot RO");
                
                % add listener for live update during user interaction
                addlistener([app.annotations.inner_annulus, ...
                             app.annotations.outer_annulus], ...
                            "MovingROI", @move_annular_detector);
                
                u.Move = addlistener([app.annotations.inner_annulus, ...
                                      app.annotations.outer_annulus], ...
                                     "ROIMoved", @move_annular_detector);

                % set properties for inner and out annulus annotations
                set([app.annotations.inner_annulus app.annotations.outer_annulus], ...
                    "FaceAlpha", 0, ...
                    "FaceSelectable", 0, ...
                    "LineWidth", 4, ...
                    "DrawingArea", "unlimited", ...
                    "Deletable", 0, ...
                    "InteractionsAllowed", "reshape", ...
                    "UserData", u);
            end

            % Function to draw segmented annotations
            function draw_segmented_detector()
                % delete any old segmented detector annotations
                delete(findobj(app.image_axes.Diffraction, "Tag",'SegDetrAnnot'))
                
                app.annotations.segmented_detector_circle = gobjects(app.NRung.Value-1,1);
                app.annotations.segmented_detector_line = gobjects(app.NSeg.Value,1);

                % plot the lines between segments
                for i = 1:app.NSeg.Value
                    app.annotations.segmented_detector_line(i) = drawline(app.image_axes.Diffraction, ...
                                                                          "Position", [0 1; 0 1] + transmitted_beam_center, ...
                                                                          "Color", "b", ...
                                                                          "LineWidth", 2);
                end
                % Zero-degree line
                app.annotations.SegDetrL0 = drawline(app.image_axes.Diffraction, ...
                                                     "Position", [transmitted_beam_center;transmitted_beam_center], ...
                                                     "Color", "w", ...
                                                     "StripeColor", "k", ...
                                                     "LineWidth", 1.5, ...
                                                     "EdgeAlpha", 0.7);

                % plot the circles between rungs
                for i = 1:app.NRung.Value - 1
                    app.annotations.segmented_detector_circle(i) = drawcircle(app.image_axes.Diffraction, ...
                                                                              "Center", transmitted_beam_center, ...
                                                                              "Radius", 1, ...
                                                                              "Color", "y", ...
                                                                              "LineWidth", 2, ...
                                                                              "FaceAlpha", 0, ...
                                                                              "FaceSelectable", false);
                end
                
                % Zero-degree point
                app.annotations.SegDetrP0 = drawpoint(app.image_axes.Diffraction, ...
                                                      "Position", transmitted_beam_center, ...
                                                      "Color", "w", ...
                                                      "LabelTextColor", "w", ...
                                                      "LabelAlpha", 0, ...
                                                      "Label", "0", ...
                                                      "Deletable", 0, ...
                                                      "Tag", "SegDetrAnnot");
                
                % add listeners to segment annotations
                addlistener(app.annotations.SegDetrP0, "MovingROI", @move_annular_detector);
                app.annotations.SegDetrP0.UserData.Move = addlistener(app.annotations.SegDetrP0, "ROIMoved", @move_annular_detector);
                
                % set segment annotation parameters
                set([app.annotations.SegDetrL0; ...
                     app.annotations.segmented_detector_circle; ...
                     app.annotations.segmented_detector_line], ...
                    "InteractionsAllowed", "none", ...
                    "Tag", "SegDetrAnnot");
            end

            % Function to draw Scan Direction alignment annotations
            function draw_scan_direction()
                p1 = transmitted_beam_center+[app.common_parameters.max_radius/2 0];
                p2 = transmitted_beam_center+[0 app.common_parameters.max_radius/2];
                
                app.annotations.ScanDir.xl = drawline(app.image_axes.Diffraction, ...
                                                      "Position", [transmitted_beam_center;p1], ...
                                                      "Color","r", ...
                                                      'LabelTextColor',"r", ...
                                                      'Label','Scan X');

                app.annotations.ScanDir.yl = drawline(app.image_axes.Diffraction, ...
                                                      "Position", [transmitted_beam_center;p2], ...
                                                      "Color", 'g', ...
                                                      'LabelTextColor', 'g', ...
                                                      'Label', 'Scan Y');

                app.annotations.ScanDir.xc = drawcircle(app.image_axes.Diffraction, ...
                                                        "Center", p1, ...
                                                        'Radius', app.TransBeamR.Value);

                app.annotations.ScanDir.yc = drawcircle(app.image_axes.Diffraction, ...
                                                        "Center", p2, ...
                                                        'Radius', app.TransBeamR.Value);
                
                % add listeners to scan direction annotations
                addlistener([app.annotations.ScanDir.xc; ...
                             app.annotations.ScanDir.yc], ...
                            "MovingROI", @move_annular_detector);
                u.Move = addlistener([app.annotations.ScanDir.xc; ...
                                      app.annotations.ScanDir.yc], ...
                                     "ROIMoved", @move_annular_detector);

                % set scan direction annotation parameters
                set([app.annotations.ScanDir.xc; ...
                     app.annotations.ScanDir.yc], ...
                    "Color", [0 0.5 1], ...
                    "FaceAlpha", 0, ...
                    "UserData",u)
                set([app.annotations.ScanDir.xl; ...
                     app.annotations.ScanDir.yl], ...
                    "MarkerSize", 1, ...
                    "LineWidth",1, ...
                    "LabelAlpha",0, ...
                    "InteractionsAllowed", "none")
                set([app.annotations.ScanDir.xc; ...
                     app.annotations.ScanDir.yc; ...
                     app.annotations.ScanDir.xl; ...
                     app.annotations.ScanDir.yl], ...
                    "Deletable", false, ...
                    "DrawingArea", "unlimited", ...
                    "Tag", "ScanDirAnnot")

                % update annular detector
                move_annular_detector(event.Source, event)
            end

            % Integrate the annular detector for the primary real-space
            % pattern `app.Axes.Real` with step size app.AnnularStep.Value
            function integrate_annular()
                debug_time = tic;
                
                % Rerun the annular integration based on the newly aligned location of the transmitted disk
                message = "Generating radial masks (may take a while)...";
                
                % Rings depend on the beam centre, the ring width in pixels and the max
                % radius (C11: also after re-calibration); see quant4d.radialBins
                step_px = app.AnnularStep.Value/app.mradPx.Value;
                if is_different_to_previous(app, 'annular_key', [app.center step_px app.common_parameters.max_radius])
                    app.tmp_variables.progress_dialog = progress_dialog(app, sprintf("\n%s\n",message), "Annular Integration");

                    [bins, edges] = quant4d.radialBins(app.dataset_parameters.n_pixels, app.center, ...
                                                       step_px, app.common_parameters.max_radius);
                    app.masks.annular_bins = bins;
                    app.common_parameters.annular_edges = edges;
                    mask_ann = cast(bins, app.dataset_parameters.data_type);

                    % Multiply data by the annular masks
                    try
                        app.images.annular_images = reshape((mask_ann*app.data)', app.dataset_parameters.n_frames(1), app.dataset_parameters.n_frames(2), []);
                    catch ME
                        if app.dataset_parameters.gpu
                            waitbar(0,app.tmp_variables.progress_dialog,message+sprintf("\nIt seems the GPU does not have enough memory.\nUsing CPU for this process ..."))
                            app.images.annular_images = reshape((mask_ann*gather(app.data))', app.dataset_parameters.n_frames(1), app.dataset_parameters.n_frames(2), []);
                            try 
                                % Move the integrated images to GPU
                                app.images.annular_images = gpuArray(app.images.annular_images);
                            catch
                            end
                        else
                            delete(app.tmp_variables.progress_dialog)
                            notification_dialog(app, ...
                                                "error", ...
                                                "It seems the system has not enough memory for this process! " ...
                                                 + "Maybe try to increase system's virtual memory.", ...
                                                "Out of Memory")
                            rethrow(ME)
                        end
                    end

                    % Close progress window
                    delete(app.tmp_variables.progress_dialog);
                end

                debug_toc(app, [], "", debug_time)
            end

            % Calculate the CoM images
            function calculate_CoM()
                debug_time = tic;
                if ~isfield(app.masks, "annular")
                    return;
                end

                inner_radius = app.InnerAnnularRadius.Value;
                outer_radius = app.OuterAnnularRadius.Value;
                scan_direction = app.ScanDirectionSlider.Value;
                flip_scan_y = 1-2*app.FlipScanDirectionY.Value;
                detector_rotation = app.DetectorRotationSlider.Value;

                [CoMX, CoMY] = integrate_CoM();
                app.images.CoMX = CoMX;
                app.images.CoMY = CoMY;

                % CoM magnitude is the length of the vector -- in mrad
                app.images.CoMMag = sqrt(CoMX.^2 + CoMY.^2);
                app.images.CoMMagNorm = rescale(app.images.CoMMag);
                
                % CoM angle was calculated from the arctangent of the difference images (CoMX and CoMY)
                app.images.CoMPh = atan2(CoMY,CoMX);
                
                % Adjust atan2 range from [-pi/2:pi/2) to [0:2pi)
                app.images.CoMPh(app.images.CoMPh < 0) = app.images.CoMPh(app.images.CoMPh < 0) + 2*pi;
                app.images.CoMPhMag = app.images.CoMPh;

                % iCoM/iDPC and dCoM/dDPC (Lazic et al., doi:10.1016/j.ultramic.2015.10.011),
                % band-passed by feature size in scan pixels; see quant4d.integrateCoM
                band = quant4d.periodsToBand([app.BandpassFilterLow.Value app.BandpassFilterHigh.Value]);
                [app.images.iCoM, app.images.dCoM] = quant4d.integrateCoM(CoMX, CoMY, band);

                debug_toc(app, [], "", debug_time)

                %% Sub sub function
                function [CoMX,CoMY] = integrate_CoM()
                    % CoM / DPC images in mrad; see quant4d.centerOfMass, quant4d.dpcCoM
                    n = app.dataset_parameters;
                    flip = flip_scan_y < 0;
                    if dmod == "CoM"
                        [CoMX, CoMY] = quant4d.centerOfMass(app.data, app.masks.annular, ...
                            transmitted_beam_center, n.n_frames, ...
                            FlipY = flip, ScanRotation = scan_direction);
                    elseif dmod == "DPC"
                        app.masks.Seg = quant4d.segmentMasks(n.n_pixels, transmitted_beam_center, ...
                            app.NSeg.Value, app.NRung.Value, inner_radius, outer_radius, ...
                            detector_rotation, flip);
                        centroids = quant4d.segmentCentroids(app.NSeg.Value, app.NRung.Value, ...
                            inner_radius, outer_radius, detector_rotation);
                        [CoMX, CoMY] = quant4d.dpcCoM(app.data, app.masks.Seg, app.masks.annular, ...
                            centroids, n.n_frames, scan_direction);
                    end
                    CoMX = CoMX*app.mradPx.Value;   % detector pixels -> mrad
                    CoMY = CoMY*app.mradPx.Value;
                end

            end

        end

        % Callback function: VirtualApertureInvert, VirtualApertureMirror, 
        % ...and 21 other components
        function virtual_aperture_callbacks(app, event)
            % Function called to during all virtual aperture interactions,
            % including entering the `Virtual Aperture` mode, drawing
            % virtual aperture annotations, and updating UI elements.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            switch event.Source
                case app.Mode % Entering mode
                    % Update UI limits
                    limit_virtual_aperture_UI(app)
                    
                    % Enable/Disable UIs
                    enable_virtual_aperture_UI(app)
                    
                    % Draw ROIs
                    draw_virtual_aperture_annotation(app)
                    
                    % Update ROI/UI
                    move_virtual_aperture(app, event.Source, event)
                    
                    % Enable windows
                    enable_windows(app,true)
                
                case app.VirtualApertureMirror % Mirror enable/disable
                    
                    % set state button icon color based on value
                    change_icon_background(app, app.VirtualApertureMirror)

                    % Enable/Disable UIs
                    enable_virtual_aperture_UI(app)
                    
                    % Draw ROIs
                    draw_virtual_aperture_annotation(app)
                    
                    % Update ROI/UI
                    move_virtual_aperture(app, event.Source, event)
                
                case app.VirtualApertureSymmetry % Symmetric option
                    % Draw ROIs
                    draw_virtual_aperture_annotation(app)
                    
                    % Update ROI/UI
                    move_virtual_aperture(app, event.Source, event)
                
                case app.DetectorCoordinateSystem % Coordinate options
                    % Update UI limits
                    limit_virtual_aperture_UI(app)
                    
                    % Update UI coordinate values
                    move_virtual_aperture(app, event.Source, event)
                
                case {app.VirtualApertureReset; app.VirtualApertureInvert; ...
                      app.VirtualApertureR; app.VirtualApertureRSpinner; ...
                      app.VirtualApertureX; app.VirtualApertureXSpinner; ...
                      app.VirtualApertureY; app.VirtualApertureYSpinner; ...
                      app.VirtualApertureMirrorRotation; app.VirtualApertureMirrorRotationSpinner; ...
                      app.VirtualApertureRotateCCW; app.VirtualApertureRotateCW; app.UpdateImages}
                    
                    % set state button icon color based on value
                    change_icon_background(app, app.VirtualApertureInvert)
                    
                    % Update ROI/UI
                    move_virtual_aperture(app, event.Source, event)
            end

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: CDDelResetMenu, CustomDetectorColor, 
        % ...and 22 other components
        function custom_detector_callbacks(app, event)
            % 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % Central beam location
            b0 = app.center;

            % Current selected row in Main Table `sel`, and the ROI group `ROI`
            if app.CustomDetectorTable.Selection > height(app.CustomDetectorTable.Data)
                app.CustomDetectorTable.Selection = [];
            end
            
            % set state button icon color based on value
            for state_button = [app.CustomDetectorInvert, ...
                                app.CustomDetectorMirror, ...
                                app.CustomDetectorFlipHorizontal, ...
                                app.CustomDetectorFlipVertical, ...
                                app.CustomDetectorTranspose]
                change_icon_background(app, state_button)
            end

            sel = app.CustomDetectorTable.Data(app.CustomDetectorTable.Selection, :); 
            ROI = {[]};
            
            if ~isempty(sel)
                ROI = app.annotations.Custom.(sel.ID);
            end

            switch event.Source
                case app.DetectorCoordinateSystem % Coordinate options
                    % Update UI coordinate systems
                    limit_custom_detector_UI()
                    
                    % Update ROI/mask/images
                    move_custom_ROI(ROI{1}, event);

                case {app.UpdateImages app.CustomDetectorInterMask app.Evaluate}
                    % Update ROI/mask/images
                    move_custom_ROI(ROI{1}, event);

                case app.Mode % Entering current mode
                    if ~isfield(app.annotations,'Custom')
                        app.annotations.Custom = [];
                    end

                    % Update UI coordinate systems
                    limit_custom_detector_UI()
                    
                    % Update Enable/Show states of all ROI groups
                    update_enable_show_ROI()
                    
                    % Update for selection change
                    if ~isempty(ROI)
                        mock_UI_callbacks(app, app.CustomDetectorTable)
                    end
                    
                    % Enable windows
                    enable_windows(app,true)

                case app.CustomDetectorTable % Main table
                    % Update Enable/Show states of all ROI groups
                    if event.EventName == "CellEdit"
                        update_enable_show_ROI()
                    end
                    
                    % Update UI and images
                    update_custom_detector_UI();
                    %if ~isempty(ROI{1})
                    move_custom_ROI(ROI{1}, event);
                    %end

                case app.CustomDetectorDeleteMask % Delete selected mask
                    % Early return if no mask selected
                    if isempty(sel)
                        return;
                    end

                    % Delete Annotations, remove field from app.A.Custom and any mask associated with the detector
                    delete(findobj(app.image_axes.Diffraction.Children, "Tag", "Custom " + sel.ID));
                    app.annotations.Custom.(sel.ID) = [];
                    app.annotations.Custom = rmfield(app.annotations.Custom,sel.ID);
                    app.masks.Custom.(sel.ID) = [];
                    app.masks.Custom = rmfield(app.masks.Custom,sel.ID);
                    app.images.Custom.(sel.ID) = [];
                    app.images.Custom = rmfield(app.images.Custom,sel.ID);
                    
                    % Remove item from main table
                    app.CustomDetectorTable.Data(app.CustomDetectorTable.Selection,:) = [];
                    
                    % Update selection
                    if isempty(app.CustomDetectorTable.Data)
                        % No selection if empty
                        app.CustomDetectorTable.Selection = [];
                        ROI = {[]};

                    elseif isempty(app.CustomDetectorTable.Selection)
                        app.CustomDetectorTable.Selection = height(app.CustomDetectorTable.Data);
                        ROI = app.annotations.Custom.(app.CustomDetectorTable.Data.ID(app.CustomDetectorTable.Selection));
                    
                    else
                        % Select last if exceeds table
                        app.CustomDetectorTable.Selection = min(app.CustomDetectorTable.Selection,height(app.CustomDetectorTable.Data));
                        ROI = app.annotations.Custom.(app.CustomDetectorTable.Data.ID(app.CustomDetectorTable.Selection));
                    end

                    % update color backgrounds in CustomDetectorTable to
                    % reflect deleted mask
                    for ii = 1:height(app.CustomDetectorTable.Data)
                        color_custom_detector_table_label(ii, app.annotations.Custom.(app.CustomDetectorTable.Data.ID(ii)){1}.UserData.Color)
                    end

                    % Update for selection change
                    mock_UI_callbacks(app, app.CustomDetectorTable)

                case app.CDDelResetMenu
                    % Remove all masks; Reset
                    delete(findobj(app.image_axes.Diffraction.Children,'-regexp', "Tag", "Custom "));
                    app.CustomDetectorTable.Data(:,:) = [];
                    app.annotations.Custom = [];
                    app.masks.Custom = [];
                    app.images.Custom = [];
                    ROI = {[]};
                    app.CustomDetectorTable.Selection = [];
                    
                    % Update for selection change
                    mock_UI_callbacks(app, app.CustomDetectorTable)

                case {app.CustomDetectorNewCircle; % Create new mask
                      app.CustomDetectorNewGrid;
                      app.CustomDetectorNewGridNoCenter;
                      app.CustomDetectorNewBandpass;
                      app.CustomDetectorNewWedge;
                      app.CustomDetectorNewPolygon;
                      app.CustomDetectorNewFromFile;
                      app.CustomDetectorNewMath}
                    % Character before 'A'
                    idl = "@";

                    % Last ID characters
                    if ~isempty(app.CustomDetectorTable.Data)
                        idl = app.CustomDetectorTable.Data(end,:).ID;
                    end 
                    
                    % warn on maximum number of custom detectors
                    if idl == "ZZ"
                        notification_dialog(app, "warn", "Mask ID can not go beyond 'ZZ'!", "Maximum Custom Detectors Capacity Reached");
                        return
                    end

                    % Serial numbers of Last ID characters, e.g. 3 for "C" or [1 2] for "AB"
                    nidl = double(char(idl))-64;
                    
                    % Convert to one single serial number for Last ID
                    nidl = (numel(nidl)-1)*nidl(1)*26 + nidl(end);
                    
                    % New ID, e.g. 'AA' for 26, "b" for 1
                    id = replace(char([floor(nidl/26), rem(nidl, 26)+1]+64),'@',"");
                    
                    % Preset values
                    app.CustomDetectorMirror.Value = 0;
                    app.CustomDetectorInvert.Value = 0;
                    app.CustomDetectorIntraMask.Value = "Union";

                    switch event.Source
                        case app.CustomDetectorNewCircle
                            roi_type = "Circle";

                        case app.CustomDetectorNewGrid
                            roi_type = "Grid";

                        case app.CustomDetectorNewGridNoCenter
                            roi_type = "GridNoCenter";
                        
                        case app.CustomDetectorNewBandpass
                            roi_type = "Bandpass";
                        
                        case app.CustomDetectorNewWedge
                            roi_type = "Wedge";
                            app.CustomDetectorMirror.Value = 1;
                        
                        case app.CustomDetectorNewPolygon
                            roi_type = "Polygon";
                        
                        case app.CustomDetectorNewFromFile, roi_type = "File";
                            mask = import_mask(app, "Diffraction");
                            % Early return if `[]` (failed/canceled)
                            if isempty(mask)
                                return
                            end
                            app.masks.Custom.(id) = mask;
                        
                        case app.CustomDetectorNewMath
                            roi_type = "Math";
                    end

                    ROI = drawCDROI(id, roi_type);
                    
                    % Early return if draw ROI failed, e.g. polygon canceled.
                    if isempty(ROI)
                        return;
                    end
                    
                    % Store the ROI group
                    app.annotations.Custom.(id) = ROI;
                    
                    % Add row to Main Table
                    app.CustomDetectorTable.Data(end + 1,:) = {id, roi_type, id, true, true, 1};
                    
                    % Select the last, just added row
                    app.CustomDetectorTable.Selection = height(app.CustomDetectorTable.Data);
                    
                    % Color the Label in Main Table
                    color_custom_detector_table_label(app.CustomDetectorTable.Selection,app.annotations.Custom.(id){1}.UserData.Color);
                    
                    % Update for selection change
                    mock_UI_callbacks(app, app.CustomDetectorTable)

                case {app.CustomDetectorIntraMask, app.CustomDetectorInvert, app.CustomDetectorMirror} % Intra-mask, Invert Mask, Mirror Mask
                    % Update values in `UserData` for current mask
                    ROI{1}.UserData.IntraMask = app.CustomDetectorIntraMask.Value;
                    ROI{1}.UserData.Inverted = app.CustomDetectorInvert.Value;
                    ROI{1}.UserData.Mirrored = app.CustomDetectorMirror.Value;
                    ROI = drawCDROI(sel.ID, sel.Type);
                    
                    % Re-drawn ROI
                    app.annotations.Custom.(sel.ID) = ROI;
                    
                    % Update for selection change
                    mock_UI_callbacks(app, app.CustomDetectorTable)

                case app.CustomDetectorColor  % Change the color of mask annotations
                    % Open color selection palette
                    color = uisetcolor(ROI{1}.UserData.Color);
                    
                    % If color unchanged
                    if isequal(color, ROI{1}.UserData.Color)
                        return;
                    end
                    ROI{1}.UserData.Color = color;

                    % make sure all overlays change color with main overlay
                    cellfun(@(r) set(findobj(r,"-property", "Color"), "Color", color),ROI);
                    color_custom_detector_table_label(app.CustomDetectorTable.Selection, color);
                    
                    % Update UI
                    update_custom_detector_UI()
                    
                    % changing mask color in "Color Mix" mode requires images to be re-plotted to match
                    if strcmp(app.CustomDetectorInterMask.Value, "Color Mix")
                        plot_custom_mask(event, "")
                    end

                case {app.CustomDetectorFlipHorizontal app.CustomDetectorFlipVertical app.CustomDetectorTranspose} % Flip and Transpose
                    % Whether diffraction is rotated by +/-90°
                    r90 = mod(app.RotateDiffraction.Value,180) == 90;

                    if sel.Type == "File"
                        % Transform the imported image array, then update/create mask from the transformed image
                        switch event.Source
                            case {app.CustomDetectorFlipHorizontal app.CustomDetectorFlipVertical}
                                % flip custom mask across horizontal/vertical axis
                                if (r90 && event.Source == app.CustomDetectorFlipHorizontal) || (~r90 && event.Source == app.CustomDetectorFlipVertical)
                                    % Visually Flip X
                                    app.masks.Custom.(sel.ID) = flipud(app.masks.Custom.(sel.ID));
                                else
                                    % Visually Flip Y
                                    app.masks.Custom.(sel.ID) = fliplr(app.masks.Custom.(sel.ID));
                                end

                            case app.CustomDetectorTranspose
                                % transpose custom mask (only available if diffraction pattern is square)
                                app.masks.Custom.(sel.ID) = app.masks.Custom.(sel.ID)';
                        end

                        % Update Images
                        move_custom_ROI(ROI{1}, event);

                    else
                        % Convert Detail Table positions to Cartesian relative (pixel or mrad)
                        details_table = app.CustomDetectorDetailsTable.Data(:, 1:2);
                        if app.DetectorCoordinateSystem.Value == "Cartesian"
                            xycr = details_table - (app.center-app.center_rel)*app.diff_scale;
                        else
                            xycr = details_table(:, 1).*[cosd(details_table(:, 2)) sind(details_table(:, 2))];
                        end

                        switch event.Source
                            case {app.CustomDetectorFlipHorizontal app.CustomDetectorFlipVertical}
                                % flip custom mask across horizontal/vertical axis
                                if (r90 && event.Source == app.CustomDetectorFlipHorizontal) || (~r90 && event.Source == app.CustomDetectorFlipVertical)
                                    % Flip X
                                    xycr(:,1) = -xycr(:,1);
                                else
                                    % Flip Y
                                    xycr(:,2) = -xycr(:,2);
                                end
                                
                            case app.CustomDetectorTranspose % transpose custom mask
                                % Swap X/Y
                                xycr = fliplr(xycr);
                        end

                        % Convert from Cartesian relative (pixel or mrad) back to whatever it should be
                        if app.DetectorCoordinateSystem.Value == "Cartesian"
                            app.CustomDetectorDetailsTable.Data(:, 1:2) = xycr + (app.center-app.center_rel)*app.diff_scale;
                        else
                            app.CustomDetectorDetailsTable.Data(:, 1:2) = [sqrt(sum(xycr.^2,2)), atan2d(xycr(:,2), xycr(:,1))];
                        end
                        
                        % Trigger Detail Table editing callbacks
                        mock_UI_callbacks(app, app.CustomDetectorDetailsTable)
                    end

                case {app.CustomDetectorRotateCCW, app.CustomDetectorRotateCW} % Rotate detector
                    % Clockwise if odd numbers of "Reverse X" "Reverse Y" "Rotate Clockwise" are true
                    rot = app.CustomDetectorRotationStep.Value*(1-2*rem(app.ReverseDiffractionX.Value+app.ReverseDiffractionY.Value+(event.Source == app.CustomDetectorRotateCW),2));
                    
                    if sel.Type == "File"
                        % Transform the imported image array, then update/create mask from the transformed image
                        app.masks.Custom.(sel.ID) = rot90(app.masks.Custom.(sel.ID), rot/90);
                        
                        % Update Images
                        move_custom_ROI(ROI{1}, event);
                    
                    else
                        % Edit coordinates in `app.CustomDetectorDetailsTable` and trigger its callbacks to rotate ROIs
                        if app.DetectorCoordinateSystem.Value == "Cartesian"
                            % If absolute then convert to relative then convert back, before/after rotation
                            R = rotation_matrix(app, rot);
                            rrb0 = (app.center-app.center_rel)*app.diff_scale;
                            app.CustomDetectorDetailsTable.Data(:, 1:2) = ((app.CustomDetectorDetailsTable.Data(:, 1:2)-rrb0)*R + rrb0);
                        else
                            app.CustomDetectorDetailsTable.Data(:, 2) = mod(app.CustomDetectorDetailsTable.Data(:, 2)+rot, 360);
                        end
                        
                        % Trigger Detail Table editing callbacks
                        mock_UI_callbacks(app, app.CustomDetectorDetailsTable)
                    end

                case app.CustomDetectorDetailsTable % Detail Table
                    % Determine Cartesian absolute pixel position from
                    % Detail Table (may be polar/relative/mrad)
                    details_table = app.CustomDetectorDetailsTable.Data;

                    if app.DetectorCoordinateSystem.Value == "Cartesian"
                        p = details_table(:, 1:2)/app.diff_scale + app.center_rel;
                    else
                        p = details_table(:, 1)/app.diff_scale.*[cosd(details_table(:, 2)) sind(details_table(:, 2))] + app.center_rel;
                    end

                    % Sync ROIs positions with the edited Detail Table
                    switch sel.Type
                        case {"Circle", "Grid", "GridNoCenter"}
                            r = details_table(1, 3);
                            % If edited the 2nd R ([2 3] in table) then use
                            % that, instead of the default 1st R
                            if isprop(event, "Indices") && isequal(event.Indices, [2 3])
                                r = str2double(event.EditData);
                            end
                            
                            ROI{1}.Center = p(1, :);
                            ROI{1}.Radius = r/app.diff_scale;

                            if height(p) > 1
                                ROI{2}.Center = p(2, :);
                                ROI{2}.Radius = r/app.diff_scale;
                            end

                        case "Bandpass"
                            color = p(1, :);
                            % If edited the 2nd X or Y ([2 1] or [2 2] in
                            % table), then use that value, instead of the
                            % default 1st X/Y
                            if isprop(event, "Indices") && event.Indices(1) == 2 && any(event.Indices(2) == [1 2])
                                color = p(2, :);
                            end

                            ROI{1}.Center = color; 
                            ROI{1}.Radius = details_table(1, 3)/app.diff_scale;
                            ROI{2}.Center = color;
                            ROI{2}.Radius = details_table(2, 3)/app.diff_scale;

                        case "Wedge"
                            ROI{1}.Position = p(1, :);
                            ROI{2}.Position = p(2, :);

                        case "Polygon"
                            ROI{1}.Position = p;
                    end

                    % Update Images
                    move_custom_ROI(ROI{1}, event);
                
                otherwise
                    error("Undefined")

            end


            %%% Sub functions
            % Function to return font color (black or white) based on input color
            function color = font_color(c)
                % Dark color criterion
                color = [0 0 0] + (c.^2*[0.299;0.587;0.114] < 0.25);
            end

            % Function to color Main Table
            function color_custom_detector_table_label(selection, color)
                addStyle(app.CustomDetectorTable, ...
                         uistyle("BackgroundColor",color,'FontColor',font_color(color)), ...
                         'cell',[selection, 3])
            end

            % Function to update UI labels; actually Custom Detector UIs have no limits
            function limit_custom_detector_UI()
                unit = " " + app.DetectorCoordinateUnit.Value;
                
                if app.DetectorCoordinateSystem.Value == "Polar"
                    app.CustomDetectorDetailsTable.ColumnName(1:3) = {"ρ"+unit, "θ °", "R"+unit};
                else
                    app.CustomDetectorDetailsTable.ColumnName(1:3) = {"X"+unit, "Y"+unit, "R"+unit};
                end
            end

            % Function to update enable/show state of ROIs based on Main Table
            function update_enable_show_ROI()
                for i = 1:height(app.CustomDetectorTable.Data)
                    ri = app.CustomDetectorTable.Data(i, :);
                    cellfun(@(r) set(findobj(r,'-property',"Visible"),"Visible", ri.Show && ri.Enable), ...
                        app.annotations.Custom.(ri.ID));
                end
            end

            % Function to update UI
            function update_custom_detector_UI()
                % Try to resize columns
                app.CustomDetectorDetailsTable.ColumnWidth = {"1x","1x","1x"};
                app.CustomDetectorTable.ColumnWidth = {"fit", "fit", "1x", "fit", "fit", "fit"};

                if ~isempty(app.CustomDetectorTable.Data)
                    app.CustomDetectorTable.Data(end + 1,:) = app.CustomDetectorTable.Data(end,:);
                    app.CustomDetectorTable.Data(end,:)=[];
                end
                
                % Disable Detail UI if no ROI selected
                app.CustomDetectorDetailsPanel.Enable = switch_on_off(app, ~isempty(app.CustomDetectorTable.Selection));

                if isempty(app.CustomDetectorTable.Selection)
                    app.CustomDetectorDetailsTable.Data = [];
                    set([app.CustomDetectorDetailsGrid app.CustomDetectorRotationGrid], "BackgroundColor","w");
                else
                    % Set component options based on current mask item
                    user_data = app.annotations.Custom.(app.CustomDetectorTable.Data.ID(app.CustomDetectorTable.Selection)){1}.UserData;
                    set([app.CustomDetectorInvert; ...
                         app.CustomDetectorIntraMask; ...
                         app.CustomDetectorMirror], ...
                        {"Value"}, ...
                        {user_data.Inverted; ...
                         user_data.IntraMask; ...
                         user_data.Mirrored})
                    
                    % Set Detail UI color; white font if darker background color
                    set([app.CustomDetectorDetailsGrid; ...
                         app.CustomDetectorRotationGrid; ...
                         app.CustomDetectorDetailsTable], ...
                        "BackgroundColor",user_data.Color)
                    color_custom_detector_table_label(app.CustomDetectorTable.Selection, user_data.Color)

                    app.CDIntraCombLabel.FontColor = font_color(user_data.Color);
                    app.CustomDetectorDetailsTable.ForegroundColor = font_color(user_data.Color);
                    
                    % Enable/Disable UI
                    set([app.CustomDetectorMirror; ...
                         app.CustomDetectorIntraMask; ...
                         app.CustomDetectorRotationStep; ...
                         app.CustomDetectorTranspose], ...
                        {"Enable"},{0;0;1;1})
                    
                    equ = "";
                    
                    switch user_data.Type
                        case "Circle"
                            app.CustomDetectorMirror.Enable = "on";
                            app.CustomDetectorIntraMask.Enable = app.CustomDetectorMirror.Value;
                        
                        case "Wedge"
                            app.CustomDetectorMirror.Enable = "on";
                        
                        case {"Grid","GridNoCenter"}
                            app.CustomDetectorIntraMask.Enable = "on";
                        
                        case "Bandpass"
                        
                        case "Polygon"
                        
                        case "File"
                            % Allow transpose/rotate 90° if diffraction
                            % image is square
                            app.CustomDetectorTranspose.Enable = ~range(app.dataset_parameters.n_pixels);
                            set(app.CustomDetectorRotationStep, ...
                                "Value", 180 - ~range(app.dataset_parameters.n_pixels)*90, ...
                                "Enable", "off");
                        
                        case "Math"
                            equ = user_data.Math;
                    end
                    
                    % Put formula on Math UI
                    app.MathFormula.Value = equ;
                end
            end

            % Function to draw annotations
            function ROI = drawCDROI(id, roi_type)
                % parameters
                r0 = app.TransBeamR.Value;
                xmin = 0;
                xmax = app.dataset_parameters.n_pixels(1)+1;
                ymin = 0;
                ymax = app.dataset_parameters.n_pixels(2)+1;

                % Initial values
                p1 = [];
                r1 = [];
                p2 = [];
                r2 = [];
                user_data = struct("ID", id, ...
                                   "Type", roi_type, ...
                                   "Color", rand(1,3), ...
                                   "Mirrored", app.CustomDetectorMirror.Value, ...
                                   "IntraMask", app.CustomDetectorIntraMask.Value, ...
                                   "Inverted", app.CustomDetectorInvert.Value);

                % If the ROIs already exist, get their current color/position/radius & UserData
                if isfield(app.annotations.Custom, id)
                    ROI = app.annotations.Custom.(id);
                    user_data = ROI{1}.UserData;

                    if isprop(ROI{1}, "Position")
                        p1 = ROI{1}.Position;
                    end
                    
                    if isprop(ROI{1}, "Center")
                        p1 = ROI{1}.Center;
                        r1 = ROI{1}.Radius;
                    end

                    if isprop(ROI{2}, "Position")
                        p2 = ROI{2}.Position;
                    end
                    
                    if isprop(ROI{2}, "Center")
                        p2 = ROI{2}.Center;
                        r2 = ROI{2}.Radius;
                    end
                    
                    % Remove old ROIs
                    delete(ROI{1});
                    delete(ROI{2});
                    delete(ROI{3});
                end

                % Draw ROIs
                ROI = cell(3,1);
                switch roi_type
                    case "Circle"
                        % Initial disk identical to the central beam
                        if isempty(p1)
                            p1 = b0;
                            r1 = r0;
                        end
                        
                        % draw main circle
                        ROI{1} = drawcircle(app.image_axes.Diffraction, ...
                                            "Center", p1, ...
                                            "Radius", r1);

                        % draw mirrored circle if enabled by user
                        if user_data.Mirrored
                            ROI{2} = drawcircle(app.image_axes.Diffraction, ...
                                                "Center", -p1+2*b0, ...
                                                "Radius", r1, ...
                                                "InteractionsAllowed", "none");
                        end

                        % set parameters
                        set([ROI{1} ROI{2}], ...
                            "FaceAlpha", 0, ...
                            "FaceSelectable", 0, ...
                            "DrawingArea", "unlimited");
                    
                    case {"Grid","GridNoCenter"}
                        % draw pair of apertures with starting size of transmitted disk
                        if isempty(p2)
                            p1 = b0 + [xmax-xmin 0]/4;
                            p2 = b0 + [0 ymax-ymin]/4;
                            r1 = r0;
                        end

                        % draw two circles for basis vectors
                        ROI{1} = drawcircle(app.image_axes.Diffraction, ...
                                            "Center", p1, ...
                                            "Radius", r1);

                        ROI{2} = drawcircle(app.image_axes.Diffraction, ...
                                            "Center", p2, ...
                                            "Radius", r1);

                        % set parameters
                        set([ROI{1} ROI{2}], ...
                            "FaceAlpha", 0, ...
                            "FaceSelectable", 0, ...
                            "DrawingArea", "unlimited")
                    
                    case "Bandpass"
                        % draw two circles for the user to resize, centered on the optic axis
                        if isempty(r2)
                            r1 = r0;
                            r2 = (xmax-xmin)/4 + r0/2;
                        end

                        % draw inner and outer circles of the band-pass
                        ROI{1} = drawcircle(app.image_axes.Diffraction, ...
                                            "Center", b0, ...
                                            "Radius",r1);

                        ROI{2} = drawcircle(app.image_axes.Diffraction, ...
                                            "Center", b0, ...
                                            "Radius", r2);

                        % set parameters
                        set([ROI{1} ROI{2}], ...
                            "FaceAlpha", 0, ...
                            "DrawingArea", "unlimited", ...
                            "FaceSelectable", false);

                        % draw a filled polygon between the two circles
                        % that the user cannot interact with, just for
                        % reference
                        ROI{3} = drawpolygon(app.image_axes.Diffraction, ...
                                             "Position", [ROI{1}.Vertices;ROI{2}.Vertices], ...
                                             "InteractionsAllowed", "none", ...
                                             "EdgeAlpha", 0, ...
                                             "FaceSelectable", false);
                    
                    case "Wedge"
                        % give polygon temporary set of points, keep
                        % invisible. Points will be sorted in move_wedge()
                        if isempty(p2)
                            l = min(app.dataset_parameters.n_pixels)/3;
                            p1 = [l l];
                            p2 = [l 2*l];
                        end

                        % draw polygon wedge and a pair of points for user
                        % interaction
                        ROI{3} = drawpolygon(app.image_axes.Diffraction, ...
                                             "Position", [p1;p2;b0], ...
                                             "InteractionsAllowed", "none");
                        ROI{1} = drawpoint(app.image_axes.Diffraction, "Position",p1);
                        ROI{2} = drawpoint(app.image_axes.Diffraction, "Position",p2);
                    
                    case "Polygon"
                        if isempty(p1)
                            notification_dialog(app, ...
                                                "help", ...
                                                sprintf("Please draw a Polygon ROI on the Diffraction image!\n\n" ...
                                                        + "Press 'Esc' to cancel during drawing. Please refer to MATLAB's 'drawpolygon' for more tips."), ...
                                                "Draw Polygon ROI");
                            
                            % Disable UIs until polygon is drawn
                            enable_windows(app,false);
                            figure(app.figures.Diffraction);
                            app.figures.Diffraction.UserData.grayout.Visible = "off";
                            
                            % draw polygon and re-enable UIs
                            ROI{1} = drawpolygon(app.image_axes.Diffraction, ...
                                                 "Color", user_data.Color);
                            p1 = ROI{1}.Position;
                            enable_windows(app,true)
                            
                            % Early return if polygon is not drawn
                            if isempty(p1)
                                delete(ROI{1});
                                ROI = [];
                                return;
                            end

                        else
                            ROI{1} = drawpolygon(app.image_axes.Diffraction, ...
                                                 "Position",p1);
                        end

                        ROI{1}.FaceSelectable = false;
                        ROI{2} = drawpolygon(app.image_axes.Diffraction, ...
                                             "Position", p1, ...
                                             "EdgeAlpha", 0, ...
                                             "InteractionsAllowed", "none");
                    
                    case "File"
                        % Invisible ROI as placeholder
                        ROI{1} = drawrectangle(app.image_axes.Diffraction, ...
                                               "Position", [0 0 xmax+1 ymax+1], ...
                                               "InteractionsAllowed", "none", ...
                                               "EdgeAlpha", 0, ...
                                               "FaceAlpha",0);
                    
                    case "Math"
                        % Invisible ROI as placeholder
                        ROI{1} = drawrectangle(app.image_axes.Diffraction, ...
                                               "Position", [0 0 xmax+1 ymax+1], ...
                                               "InteractionsAllowed", "none", ...
                                               "EdgeAlpha", 0, ...
                                               "FaceAlpha",0);

                        % set defaults
                        app.MathFormula.Value = "1";
                        user_data.Math = "1";
                        
                        % Show and select Math Tab
                        figure(app.figures.Settings);
                        app.SettingsTabGroup.SelectedTab = app.MathTab;
                end
                
                % Try to set common properties for all ROI objects
                for i = 1:numel(ROI)
                    if ~any(ishandle(ROI{i}))
                        continue;
                    end

                    % set parameters
                    set(ROI{i}, ...
                        "Color", user_data.Color, ...
                        "Deletable", true, ...
                        "Tag", "Custom "+id, ...
                        "UserData", user_data)
                    
                    % add listeners
                    ROI{i}.UserData.Move = addlistener(ROI{i}, "ROIMoved", @move_custom_ROI);
                    addlistener(ROI{i}, "MovingROI", @move_custom_ROI);
                    addlistener(ROI{i},'ROIClicked', @move_custom_ROI);
                    addlistener(ROI{i}, "DeletingROI", @move_custom_ROI);
                end
            end

            % Function for UI/ROI changes
            function move_custom_ROI(source, event)
                debug_time = tic;
                
                if strcmp(event.EventName, "DeletingROI")
                    if isempty(app.CustomDetectorTable.Selection)
                        app.CustomDetectorTable.Selection = find(app.CustomDetectorTable.Data.ID == event.Source.UserData.ID);
                    end
                    custom_detector_callbacks(app, struct("Source",app.CustomDetectorDeleteMask));
                    return;
                end

                % Clear diffraction mask and real images if empty source; early return
                if isempty(source)
                    plot_custom_mask(event, []);
                    return;
                end

                % Retrieve ROIs of the current interacted-with
                ROI = app.annotations.Custom.(replace(source.Tag, "Custom ",""));
                user_data = ROI{1}.UserData;

                % Change selected mask based on the one the user is interacting with
                if app.CustomDetectorTable.Data.ID(app.CustomDetectorTable.Selection) ~= user_data.ID
                    app.CustomDetectorTable.Selection = find(app.CustomDetectorTable.Data.ID == user_data.ID);
                    update_custom_detector_UI();
                end

                % Get position etc from ROI
                p1 = [];
                r1 = [];
                p2 = [];
                r2 = [];
                p1t = [];
                p2t = [];

                if isprop(ROI{1}, "Position")
                    p1 = ROI{1}.Position;
                end

                if isprop(ROI{1}, "Radius")
                    p1 = ROI{1}.Center;
                    r1 = ROI{1}.Radius;
                end

                % Types with significant 2nd ROI
                if ismember(user_data.Type, ["Grid"; "GridNoCenter"; "Bandpass"; "Wedge"])
                    if isprop(ROI{2}, "Position")
                        p2 = ROI{2}.Position;
                    end

                    if isprop(ROI{2}, "Radius")
                        p2 = ROI{2}.Center;
                        r2 = ROI{2}.Radius;
                    end
                end

                % Update Detail Table with coordinate options, with maybe reduced calculation policy
                if is_static_event(app, event) || app.CalculationPolicy.Value == 2
                    if ~isempty(p1)
                        p1t = p1(:, 1:2);
                    end

                    if ~isempty(p2)
                        p2t = p2(:, 1:2);
                    end

                    xyt = ([p1t; p2t] - app.center_rel)*app.diff_scale;

                    if app.DetectorCoordinateSystem.Value == "Polar"
                        xyt = [sqrt(sum(xyt.^2, 2)), mod(atan2d(xyt(:, 2), xyt(:, 1)), 360)];
                    end

                    app.CustomDetectorDetailsTable.Data = [xyt, [r1;r2]*app.diff_scale];
                end

                % Diffraction image size limits
                xmin = 0;
                xmax = app.dataset_parameters.n_pixels(1)+1;
                ymin = 0;
                ymax = app.dataset_parameters.n_pixels(2)+1;

                switch user_data.Type
                    case "Circle"
                        % Make mask from current detector objects
                        mask = createMask(ROI{1}, app.image_displays.Diffraction)';

                        if user_data.Mirrored
                            % update circle{2} location
                            ROI{2}.Center = 2*b0 - p1;
                            ROI{2}.Radius = r1;

                            % Mask of mirrored circle
                            mask2 = createMask(ROI{2}, app.image_displays.Diffraction)';

                            switch user_data.IntraMask
                                case "Additive"
                                    mask = mask + mask2;

                                case "Union"
                                    mask = mask | mask2;

                                case "Intersection"
                                    mask = mask & mask2;
                            end
                        end

                    case {"Grid", "GridNoCenter"}
                        % Either from ROI{1} or ROI{2}
                        if isprop(event, "CurrentRadius")
                            r1 = event.CurrentRadius;
                        end

                        % Sync radii of both ROIs
                        ROI{1}.Radius = r1;
                        ROI{2}.Radius = r1;

                        
                        % max # of repeats (anything larger gets laggy)
                        nRep = 100;
                        
                        % Find position of all circles in the grid
                        [repsy, repsx] = meshgrid(-nRep:nRep);
                        reps = [reshape(repsx,[],1), reshape(repsy,[],1)];

                        % if "GridNoCenter" remove all even repeats to
                        % ignore transmitted beam and equivalents
                        if strcmp(user_data.Type, "GridNoCenter")
                            reps(all(mod(reps,2) == 0,2) | all(mod(reps,2) == 1,2),:) = [];
                        end
                        
                        % apply basis vectors to each circle
                        reps = reps*([p1; p2]-b0) + b0;
                        
                        % Remove duplicates within single precision
                        reps = uniquetol(reps,eps("single"),"ByRows",true);

                        % filter out any grid points outside the diffraction pattern
                        reps(reps(:,1) < -r1 | ...
                             reps(:,2) < -r1 | ...
                             reps(:,1) > xmax+r1 | ...
                             reps(:,2) > ymax+r1, :) = [];
                        
                        % Draw circles for grid
                        delete(ROI{3})
                        ROI{3} = viscircles(app.image_axes.Diffraction, ...
                                            reps, r1+reps(:,1)*0, ...
                                            "EnhanceVisibility", false, ...
                                            "Color", user_data.Color);

                        % Copy properties
                        ROI{3}.Tag = ROI{1}.Tag;
                        ROI{3}.Visible = ROI{1}.Visible;
                        
                        % Make mask from current detector grid
                        [ygrid,xgrid] = meshgrid(1:app.dataset_parameters.n_pixels(2), 1:app.dataset_parameters.n_pixels(1));
                        mask = reshape(sum(sqrt((xgrid(:)-reps(:,1)').^2+(ygrid(:)-reps(:,2)').^2) <= r1, 2), app.dataset_parameters.n_pixels);

                        switch user_data.IntraMask
                            case "Additive"

                            case "Union"
                                mask = logical(mask);

                            case "Intersection"
                                mask = mask > 1;
                        end

                    case "Bandpass"
                        % Sync centers if moved
                        if isprop(event, "CurrentCenter")
                            p1 = event.CurrentCenter;
                            set_external_source(app, event,[ROI{1}, ROI{2}],"Center",p1)
                        end

                        % Generate mask
                        pos = [ROI{2}.Vertices; ROI{1}.Vertices];
                        ROI{3}.Position = pos;
                        mask = createMask(ROI{3}, app.image_displays.Diffraction)';
                        
                        % Invert only ROI appearance here
                        if user_data.Inverted
                            ROI{3}.Position = [pos;
                                               [xmax, pos(end,2);
                                                xmax, ymax;
                                                xmin, ymax;
                                                xmin, ymin;
                                                xmax, ymin;
                                                xmax, pos(end,2)] ...
                                               ];
                        end

                    case "Wedge"
                        % Get polar degrees of the two Point ROIs in `dp`, and sort as `dp(1)` < `dp(2)`
                        dp = [p1;p2] - b0;
                        dp = sort(mod(atan2d(dp(:,2), dp(:,1)), 360));

                        % Make sure the in-between angle < 180
                        if dp(2)-dp(1) > 180
                            dp = [dp(2) dp(1)+360];
                        end

                        % `d1` & `d2` are for degrees of vertices of the two symmetric sectors, `dp` as initials
                        d1 = dp;
                        d2 = dp + 180;

                        % Extra logics for inverted/mirrored mask
                        if user_data.Inverted
                            d1 = [dp(2) dp(1)+360];
                        end

                        if user_data.Inverted && user_data.Mirrored
                            d1 = [dp(2) dp(1)+180];
                            d2 = [dp(2)+180 dp(1)+360];
                        end

                        % Insert diagonal degrees to cover the corners
                        cnr = 45:90:720;
                        d1 = [d1(1), cnr(cnr >= d1(1) & cnr <= d1(2)), d1(2)];
                        d2 = [d2(1), cnr(cnr >= d2(1) & cnr <= d2(2)), d2(2)];
                        
                        % Ignore `d2` for single-sided mask, then convert to
                        % X/Y and insert the center [0 0] as starting point
                        if user_data.Mirrored
                            d = [d1 fliplr(d2)]';
                        else
                            d = d1';
                        end

                        ROI{3}.Position = [0 0; 2*max(ymax,xmax).*[cosd(d) sind(d)]] + b0;
                        
                        % Generate mask
                        mask = createMask(ROI{3}, app.image_displays.Diffraction)';
                        
                        % Extra inversion, because it'll be inverted universally at the end
                        if user_data.Inverted
                            mask = 1 - mask;
                        end

                    case "Polygon"
                        % Invert only ROI appearance here
                        if user_data.Inverted
                            endPt = p1(end,:);
                            endPtAng = atan2d(endPt(2) - b0(2), endPt(1) - b0(1));
                            
                            if endPtAng < 135 && endPtAng >= 45
                                % top edge
                                corners = [endPt;endPt(1),ymax; xmax,ymax; xmax,ymin; xmin,ymin; xmin,ymax; endPt(1),ymax;endPt];
                            
                            elseif endPtAng < 45 && endPtAng >= -45
                                % right edge
                                corners = [endPt;xmax,endPt(2); xmax,ymax; xmin,ymax; xmin,ymin; xmax,ymin; xmax,endPt(2);endPt];
                            
                            elseif endPtAng < -45 && endPtAng >= -135
                                % bottom edge
                                corners = [endPt;endPt(1),ymin; xmin,ymin; xmin,ymax; xmax,ymax; xmax,ymin; endPt(1),ymin;endPt];
                            
                            else
                                % left edge
                                corners = [endPt;xmin,endPt(2); xmin,ymax; xmax,ymax; xmax,ymin; xmin,ymin; xmin,endPt(2);endPt];
                            end
                            pos2 = [corners;p1];
                            faceAlpha = 0;
                        else
                            pos2 = p1;
                            faceAlpha = 0.2;
                        end

                        % update poly2 points and faceAlpha for both. set max alpha to 0.2
                        ROI{1}.FaceAlpha = faceAlpha;
                        ROI{2}.FaceAlpha = 0.2 - faceAlpha;
                        ROI{2}.Position = pos2;
                        
                        % generate mask
                        mask = createMask(ROI{1}, app.image_displays.Diffraction)';

                    case "File"
                        % Only deal with visual here
                        mask = app.masks.Custom.(user_data.ID);
                        
                        % Invert only ROI appearance here
                        if user_data.Inverted
                            mask = max(mask,[], "all") - mask;
                        end
                        
                        delete(ROI{2})
                        
                        % Draw boundaries of imported file mask
                        try
                            visb = visboundaries(app.image_axes.Diffraction, ...
                                                 bwboundaries(mask'), ...
                                                 "Color", user_data.Color, ...
                                                 "EnhanceVisibility", 0);

                            % If some boundary is drawn, copy properties
                            if ~isempty(visb)
                                visb.Tag = ROI{1}.Tag;
                                visb.Visible = ROI{1}.Visible;
                                ROI{2} = visb;
                            end
                        catch
                        end

                        % Actual mask is already updated before
                        app.masks.Custom.(user_data.ID) = mask;

                    case "Math"
                        message = strings(0);
                        
                        % Get/Store formula
                        equ0 = string(strjoin(app.MathFormula.Value));
                        ROI{1}.UserData.Math = equ0;
                        
                        % Extract "A" "AB" etc
                        ms = unique(string(regexp(equ0, "\<[A-Z]+\>", "match")));

                        ids = string(fieldnames(app.annotations.Custom));
                        
                        % Existing IDs and Unknown IDs
                        unk = setdiff(ms,ids);
                        
                        % Check IDs
                        if numel(unk)
                            message(end + 1) = sprintf("Unknown IDs: %s !", strjoin(unk, ", "));
                        end
                        
                        if ismember(user_data.ID, ms)
                            message(end + 1) = sprintf("Self ID (%s) encountered!", user_data.ID);
                        end
                        
                        % Try to evaluate
                        if isempty(message)
                            equ = regexprep(equ0, "\<" + ms + "\>", "app.masks.Custom." + ms); 
                            mask_t = [];
                            try
                                mask_t = eval(equ);
                                mask = zeros(app.dataset_parameters.n_pixels) + mask_t;
                            catch ME
                                message(end + 1) = sprintf('%s\n%s\n%s', ME.identifier, ME.message, ME.Correction);
                                % Check result size
                                if ~isempty(mask_t)
                                    message(end + 1) = sprintf("Resulted mask size is %d×%d (X×Y).", size(mask_t));
                                end
                            end
                        end

                        % Check real/complex
                        if isempty(message) && ~isreal(mask)
                            message(end + 1) = sprintf("Resulted mask is a complex array!");
                        end
                        
                        % Early return if any error
                        if ~isempty(message)
                            notification_dialog(app, ...
                                                "warn", ...
                                                "Calculation failed!" + sprintf("\n%s",message), ...
                                                "Evaluation Failed");
                            return
                        end

                        delete(ROI{2})
                        
                        % Draw boundaries of calculated mask
                        try
                            visb = visboundaries(app.image_axes.Diffraction, ...
                                                 bwboundaries(mask'), ...
                                                 "Color", user_data.Color, ...
                                                 "EnhanceVisibility",0);

                            % If some boundary is drawn, copy properties
                            if ~isempty(visb)
                                visb.Tag = ROI{1}.Tag;
                                visb.Visible = ROI{1}.Visible;
                                ROI{2} = visb;
                            end
                        catch
                        end
                end

                % bring ROIs to the front
                for i_ROI = 3:-1:1
                    if ismethod(ROI{i_ROI},'bringToFront')
                        bringToFront(ROI{i_ROI});
                    end
                end
                
                % Assign the created ROIs back to the global handle
                app.annotations.Custom.(user_data.ID) = ROI;
                
                % Invert mask
                if user_data.Inverted
                    mask = max(mask,[], "all") - mask;
                end
                
                % Store mask
                app.masks.Custom.(user_data.ID) = mask;

                % Store color mix mask
                if strcmp(app.CustomDetectorInterMask.Value, "Color Mix")
                    app.masks.CustomColor.(user_data.ID) = mask.*reshape(app.annotations.Custom.(user_data.ID){1}.Color,[1 1 3]);
                end

                plot_custom_mask(event, user_data.ID)
                debug_toc(app, event, "", debug_time)
            end

            function plot_custom_mask(event, id)
                debug_time = tic;
                % Whether to update images
                if to_update_image(app, event)
                    % start with a clear mask
                    custom_mask = zeros(app.dataset_parameters.n_pixels, app.dataset_parameters.data_type);
                    
                    % Go through all enabled AND non-zero-weighting masks; add/intersect them accordingly
                    cds = app.CustomDetectorTable.Data(app.CustomDetectorTable.Data.Enable & app.CustomDetectorTable.Data.Weight, :);

                    % exit if there are no custom masks
                    if isempty(cds)
                        app.images.DiffractionMask = custom_mask;
                        app.masks.CustomColorMix = [];
                        app.masks = rmfield(app.masks,"CustomColorMix");
                        app.images.Real = zeros(app.dataset_parameters.n_frames, app.dataset_parameters.data_type);
                        plot_all_patterns(app, event)
                        return
                    end

                    % split masks by color if in "Color Mix" mode
                    if strcmp(app.CustomDetectorInterMask.Value, "Color Mix")
                        color_masks = zeros([height(cds),prod(app.dataset_parameters.n_pixels)],app.dataset_parameters.data_type);
                        app.masks.CustomColorMix = zeros([prod(app.dataset_parameters.n_pixels) 3],app.dataset_parameters.data_type);
                        color_mix_list = zeros([3 height(cds)]);
                    end

                    for i = 1:height(cds)
                        selection = cds(i, :);
                        maski = app.masks.Custom.(selection.ID)*selection.Weight;
                        switch app.CustomDetectorInterMask.Value
                            case "Additive"
                                custom_mask = custom_mask + maski;

                            case "Current-only"
                                if strcmp(selection.ID,id)
                                    custom_mask = maski;
                                end

                            case "Intersection"
                                if i == 1
                                    custom_mask = maski;
                                else
                                    custom_mask = custom_mask & maski;
                                end

                            case "Union"
                                custom_mask = custom_mask | maski;

                            case "Color Mix"
                                color_masks(i,:) = maski(:);
                                color_mix_list(:,i) = app.annotations.Custom.(selection.ID){1}.UserData.Color;
                                custom_mask = custom_mask | maski;
                        end
                    end

                    % Update images if the mask actually changed OR not a changing event
                    if ~isequal(app.images.DiffractionMask, custom_mask) || is_static_event(app, event)
                        app.images.DiffractionMask = custom_mask;
                        app.images.Real = gather(reshape(reshape(custom_mask,1,[])*app.data, app.dataset_parameters.n_frames));
                        
                        if strcmp(app.CustomDetectorInterMask.Value, "Color Mix")
                            app.masks.CustomColorMix = permute(reshape((color_mix_list*color_masks)',[app.dataset_parameters.n_pixels 3]),[2 1 3]);
                            app.images.RealColorMix = gather(rescale(reshape((color_mix_list*color_masks*app.data)',[app.dataset_parameters.n_frames 3])));
                        end

                    end

                    plot_all_patterns(app, event)
                end
                debug_toc(app, event, "", debug_time)
            end

        end

        % Callback function: BandpassFilter, BandpassFilter, 
        % ...and 5 other components
        function first_moment(app, event)
            % Function called when the user applies a filter to iDPC/dDPC
            % or iCoM/dCoM images, or saves a vector field image
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch event.Source
                case app.SaveVecMenu
                    % save vector field as image and figure
                    save_vector_field(app);
                    
                case {app.BandpassFilterLow, app.BandpassFilterHigh}
                    % update app.BandpassFilter RangeSlider
                    app.BandpassFilter.Value = sort([app.BandpassFilterLow.Value,app.BandpassFilterHigh.Value]);
                    app.BandpassFilterLow.Value = min(app.BandpassFilter.Value);
                    app.BandpassFilterHigh.Value = max(app.BandpassFilter.Value);

                case app.BandpassFilter
                    % update app.BandpassFilterLow and
                    % app.BandpassFilterLow spinners
                    app.BandpassFilterLow.Value = event.Value(1);
                    app.BandpassFilterHigh.Value = event.Value(2);
            end

            % update images
            mock_UI_callbacks(app, app.UpdateImages)
        end

        % Button pushed function: ShowCoMMagnitudeWindow, 
        % ...and 16 other components
        function show_window(app, event)
            % Function called when the user presses any of the Show*Window
            % buttons
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            debug_time = tic;

            id = app.DisplayImage.Value;
            switch event.Source
                case app.ShowImageWindow
                    % Show selected image
                    figure(app.figures.(id));
                    %movegui(app.figures.(id))
                
                case app.ShowMaskWindow
                    % Show diffraction or Real `space` mask
                    % for the selected image
                    id = app.image_axes.(id).UserData.space + "Mask";
                    figure(app.figures.(id));
                    %movegui(app.figures.(id))
                
                otherwise
                    % All other `app.Show***Window`
                    id = event.Source.Tag;
                    figure(app.figures.(id))
                    %movegui(app.figures.(id))

                    % If `id` is one of the available images, select it
                    if ~app.DisplayLock.Value && ...
                       ~strcmp(app.DisplayImage.Value, id) && ...
                       ismember(id, app.DisplayImage.ItemsData)
                        mock_UI_callbacks(app, app.DisplayImage, id)
                    end
            end

            debug_toc(app, event, "", debug_time)
        end

        % Callback function: SetAllDiffractionWindows, SetAllRealWindows, 
        % ...and 6 other components
        function resize_window(app, event)
            % Function called when the user sets the size of one or more
            % windows from the `Window size and orientation` panel in the
            % `Windows` tab of the Settings UI. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % `Diffraction` or `Real` space from source Tag
            space = event.Source.Tag;
            
            % user-defined window size from Settings UI window
            window_size = [app.("Set" + space + "WindowWidth").Value ...
                           app.("Set" + space + "WindowHeight").Value];

            % ensure window size is in range [1, screen_avail]
            window_size = clip(window_size, 1, app.sys_constants.screen_avail(3:4));

            switch event.Source
                case {app.SetDiffractionWindow, app.SetRealWindow}
                    % Only resize currently selected image window
                    id = app.DisplayImage.Value;

                    % If the selected image is not of that space (i.e.
                    % app.DisplayLock.Value = true), then resize the
                    % primary image window for that space instead
                    if app.image_axes.(id).UserData.space ~= space
                        id = space;
                    end

                    % get image axes position
                    pos = app.image_axes.(id).Position;

                    % set window size
                    app.figures.(id).Position(3:4) = window_size;
                    
                    % make sure figure window stays on the screen
                    off_screen = app.figures.(id).Position(1:2) + window_size > app.sys_constants.screen_avail(3:4);
                    if any(off_screen)
                        shift = (app.sys_constants.screen_size(3:4) - (app.figures.(id).Position(1:2) + window_size + [0, app.sys_constants.title_height])).*(off_screen);
                        app.figures.(id).Position(1:2) = app.figures.(id).Position(1:2) + shift;
                    end

                    % make sure image axes position remains unchanged after
                    % window size change
                    app.image_axes.(id).Position = pos;
                
                case {app.SetAllDiffractionWindows, app.SetAllRealWindows}
                    % Resize all image windows of the given space
                    for fig = app.ui_groups.image_figures(app.ui_groups.image_space == space)'
                        % get image axes and position
                        ax = fig.CurrentAxes;
                        pos = ax.Position;

                        % set window size
                        fig.Position(3:4) = window_size;
                        
                        % make sure figure window stays on the screen
                        off_screen = fig.Position(1:2) + window_size > app.sys_constants.screen_size(3:4);
                        if off_screen
                            shift = (app.sys_constants.screen_size(3:4) - (fig.Position(1:2) + window_size + [0, app.sys_constants.title_height])).*(off_screen);
                            fig.Position(1:2) = fig.Position(1:2) + shift;
                        end

                        % make sure image axes position remains unchanged after
                        % window size change
                        ax.Position = pos;
                    end
            end

            % always keep diffraction_dropdown in the upper right hand
            % corner of the diffraction figure
            app.diffraction_dropdown.Position = [0, app.figures.Diffraction.Position(4) - app.diffraction_dropdown.Position(4), 65, 22];
        end

        % Callback function: CalculationPolicy, UpdateImages
        function update_images(app, event)
            % Function called when the user changes the CalculationPolicy
            % (`Active`, `Reduced` or `Passive`) or explicitly refreshes
            % the images (can also be called programmatically). 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch event.Source
                case app.CalculationPolicy
                    % Update once if not passive
                    if event.Value
                        mock_UI_callbacks(app, app.UpdateImages);
                    end

                case app.UpdateImages
                    % Calculate and update all images by triggering
                    % detector callbacks
                    switch app.Mode.Value
                        case "Preview"
                            preview_callbacks(app, event)

                        case "Alignment"
                            transmitted_beam_callbacks(app, event)
                        
                        case {'Annular' 'CoM' 'DPC'}
                            annular_detector_callbacks(app, event)
                        
                        case "Virtual"
                            virtual_aperture_callbacks(app, event)
                        
                        case "Custom"
                            custom_detector_callbacks(app, event)
                    end

                    % Trigger real-space ROI callbacks
                    if app.Mode.Value ~= "Preview"
                        realspace_ROI_callbacks(app, event)
                    end
            end
        end

        % Menu selected function: ResetQuant4DMenu
        function reset_Quant4D(app, event)
            % Function to revert all UI properties to their initial state
            % and unload all data from RAM and the GPU, if used.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % A state like just start-up without import
            unload_data(app)
            mock_UI_callbacks(app, app.Mode, "Preview")
        end

        % Menu selected function: EnableallUIsMenu
        function enable_all_UI(app, event)
            % Context menu item to re-enable all UI elements. Mostly used
            % for debugging. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % Try to delete any progress window
            try delete(app.tmp_variables.progress_dialog); catch; end
            
            % Enable all windows
            enable_windows(app,true)
        end

        % Menu selected function: Test1Menu
        function test1(app, event)
            % User editable function for debugging. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % places main window at top left of main screen, with settings, diffraction and real space windows immediately adjacent
            app.Quant4D_Fig.Position(1:2) = [1,app.sys_constants.screen_size(4) - app.Quant4D_Fig.Position(4)-app.sys_constants.title_height];
            for ii=1:2 % running it twice makes it work better for some reason
                app.figures.Settings.Position(1) = sum(app.Quant4D_Fig.Position([1,3])) + 1;
                app.figures.Diffraction.Position(1) = sum(app.figures.Settings.Position([1,3])) + 1;
                app.figures.Preview.Position(1) = sum(app.figures.Settings.Position([1,3])) + 1;
                app.figures.Real.Position(1) = sum(app.figures.Diffraction.Position([1,3])) + 1;
                app.figures.Import.Position(1) = sum(app.figures.Diffraction.Position([1,3])) + 1;
                app.figures.Settings.Position(2:4) = app.Quant4D_Fig.Position(2:4);
                app.figures.Diffraction.Position(2:4) = app.Quant4D_Fig.Position([2,4,4]);
                app.figures.Preview.Position(2:4) = app.Quant4D_Fig.Position([2,4,4]);
                app.figures.Real.Position(2:4) = app.Quant4D_Fig.Position([2,4,4]);
                app.figures.Import.Position(2) = app.figures.Preview.Position(2)+app.figures.Preview.Position(4)-app.figures.Import.Position(4);
            end
        end

        % Menu selected function: Test2Menu
        function test2(app, event)
            % User editable function for debugging. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % Can be used for debugging or interfacing with internal data.
            % Add a breakpoint on the line below, run the program, then
            % right click on the "Import" button and select Test2
            fprintf("");
        end

        % Close request function: Quant4D_Fig
        function close_function(app, event)
            % Function called to ensure that all figure windows and any
            % progress dialogs are closed when the app exits.
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            % close the progress bar if its open
            try delete(app.tmp_variables.progress_dialog);catch;end

            % make sure all figures are closed after the app is closed

            try figs = app.ui_groups.image_figures; catch; figs =[]; end
            delete(app);
            
            for ii = 1:numel(figs)
                try close(figs(ii)); catch; end
            end
            clear figs;

            % remove `app` from base workspace as it is no longer valid
            evalin('base', 'clear app')
        end

        % Callback function: ShowVariables, VariablesTree
        function variable_viewer(app, event)
            % Function used to display or hide the variable viewer treenode
            % in the Settings UI. 
            % 
            % Parameters:
            %    app (Quant4D)
            %    event (event.EventData)
            %
            % Returns:
            %    None

            switch app.ShowVariables.Value
                case true
                    app.VariablesTab.Parent = app.SettingsTabGroup;
                    app.ShowVariables.Text = "Hide all variables";
                    app.SettingsTabGroup.SelectedTab = app.VariablesTab;
                case false
                    app.VariablesTab.Parent = [];
                    app.ShowVariables.Text = "Show all variables";
            end
            % Get currently selected node
            selectedNode = app.VariablesTree.SelectedNodes;

            % Only show these variables/structures 
            group_names = {"dataset_parameters";
                           "common_parameters";
                           "sys_constants";
                           "figures";
                           "images";
                           "masks";
                           "image_axes";
                           "annotations";
                           "ui_groups"};

            % Refresh TreeNode as needed
            for i_group = 1:numel(group_names)
                group_name = group_names{i_group};
                
                % Add TreeNode if it doesn't already exist or is invalid
                if ~isfield(app.variable_nodes,group_name) || ...
                   ~isa(app.variable_nodes.(group_name),'matlab.ui.container.TreeNode') || ...
                    ~isvalid(app.variable_nodes.(group_name))

                    app.variable_nodes.(group_name) = uitreenode(app.VariablesTree, "Text", group_name);
                end
                
                % Populate the branches on the TreeNode
                get_fields(app, app.variable_nodes.(group_name), app.(group_name))
            end

            % If node is selected, show variable data in app.VariablesTable
            if ~isempty(selectedNode)
                % get parent
                parent = selectedNode.Parent;
                tree_path = selectedNode.Text;

                % Get all TreeNode parents above it
                while isa(parent,'matlab.ui.container.TreeNode')
                    tree_path = [parent.Text,'.',tree_path];
                    parent = parent.Parent;
                end

                % Absolute path 
                tree_path = ['app.', tree_path];

                % Get variable in a suitable way for displaying
                app.VariablesTable.Data = get_variable_display(tree_path);
            end            

            function value = get_variable_display(variable_path)
                value = [];

                % get the variable from the text string
                try
                    item = eval(variable_path);
                catch 
                    return
                end

                item_class = class(item);

                switch item_class
                    case 'char'
                        value = string(item);

                    case {'string' 'cell'}
                        if isscalar(item)
                            value = item;
                        elseif isrow(item)
                            value = item';
                        else
                            value = item;
                        end
                    
                    case {'images.roi.Circle', ...
                          'images.roi.Rectangle', ...
                          'images.roi.Line', ...
                          'images.roi.Point', ...
                          'images.roi.Polygon', ...
                          'matlab.graphics.shape.Rectangle', ...
                          'matlab.ui.control.Button'}
                        try
                            item_class = arrayfun(@(r) string(class(r)), item, 'UniformOutput', false);

                            if all(isprop(item,'Name'))
                                value = reshape({item.Name},[],1);
                            elseif all(isprop(item,'Tag'))
                                value = reshape({item.Tag},[],1);
                            else
                                error('');
                            end

                            if numel(item_class) == numel(value) && isequal(size(item_class),size(value))
                                value = table([value,item_class]);
                            end

                        catch
                            try
                                value = arrayfun(@(r) class(r), item, 'UniformOutput', false);
                            catch
                                value = item_class;
                            end
                        end

                    case 'struct'
                        try
                            value = [fieldnames(item), struct2cell(item)];
                        catch
                            value = fieldnames(item);
                        end

                        if ~iscolumn(value)
                            value = cell2table(value);
                        end

                    otherwise
                        if isnumeric(item)
                            if ~iscolumn(item) && ~isrow(item) && ndims(item)>=2
                                % print shape and class of array instead of
                                % the array itself
                                value = sprintf("[%s %s]",string(size(item)).join("×"),class(item));
                            else
                                % return the item itself
                                value = item;
                            end
                        
                        elseif islogical(item)
                            if isscalar(item)
                                value = string(item);
                            else
                                value = sprintf("[%s %s]",string(size(item)).join("×"),class(item));
                            end

                        elseif isgraphics(item)
                            if isscalar(item)
                                value = string(item_class);
                            else
                                try
                                    item_class = arrayfun(@(r) string(class(r)), item, 'UniformOutput', false);
                                    
                                    if all(isprop(item,'Name'))
                                        value = reshape({item.Name},[],1);
                                    elseif all(isprop(item,'Tag'))
                                        value = reshape({item.Tag},[],1);
                                    elseif all(isprop(item,'Text'))
                                        value = reshape({item.Text},[],1);
                                    else
                                        error('')
                                    end

                                    if numel(item_class) == numel(value) && isequal(size(item_class),size(value))
                                        value = table([value,item_class]);
                                    end
                                catch 
                                    try
                                        value = arrayfun(@(r) class(r), item, 'UniformOutput', false);
                                    catch
                                        value = item_class;
                                    end
                                end
                            end
                        else
                            value = "Unknown";
                        end
                end

                if ~isscalar(item) && isrow(item) || (isrow(value) && ~isstring(value)) && ~istable(value)
                    value = value';
                end

                if ischar(value)
                    value = string(value);
                end

                switch size(value,2)
                    case 2
                        app.VariablesTable.ColumnName = {"Name", "Value"};
                        app.VariablesTable.ColumnWidth = 'auto';
                    otherwise
                        app.VariablesTable.ColumnName = "Value";
                        app.VariablesTable.ColumnWidth = '1x';
                end
                
            end
        end
    end

    % App creation
    methods (Access = public)

        % Construct app
        function app = Quant4D(varargin)
            app = app@matlab.apps.App(varargin{:});

            if nargout == 0
                clear app
            end
        end
    end
end
