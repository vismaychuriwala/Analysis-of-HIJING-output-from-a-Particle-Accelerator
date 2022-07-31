int initialize()
{

    // creating the file
    TFile *root_file = new TFile("AnalysisResults.root", "CREATE");
    TH1F *hist_pions = new TH1F("hist_pions", "Histogram for Pions", 100, 0., 4.5);
    TH1F *hist_kaons = new TH1F("hist_kaons", "Histogram for Kaons", 100, 0., 4.5);
    TH1F *hist_protons = new TH1F("hist_protons", "Histogram for Protons", 100, 0., 4.5);

    // Title
    hist_pions->GetXaxis()->SetTitle("p_T (GeV/c)");
    hist_kaons->GetXaxis()->SetTitle("p_T (GeV/c)");
    hist_protons->GetXaxis()->SetTitle("p_T (GeV/c)");

    // writing the histograms into the ROOT File
    hist_pions->Write("hist_pions", TObject::kSingleKey);
    hist_kaons->Write("hist_kaons", TObject::kSingleKey);
    hist_protons->Write("hist_protons", TObject::kSingleKey);

    return 0;
}
