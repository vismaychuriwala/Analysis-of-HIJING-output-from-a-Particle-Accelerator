int show()
{ TCanvas *c = new TCanvas("c", "Results");

TFile *histogram_file = TFile::Open("AnalysisResults.root","UPDATE");        //get content of file AnalysisResults.root
    if(!histogram_file){return 1;}

    TH1F *hist_pions = dynamic_cast<TH1F*>(histogram_file->Get("hist_pions"));         //get pointer to histograms
    TH1F *hist_kaons = dynamic_cast<TH1F*>(histogram_file->Get("hist_kaons"));
    TH1F *hist_protons = dynamic_cast<TH1F*>(histogram_file->Get("hist_protons"));


c->Divide(3,1); // divide horizontal axis in two, and vertical leave intact

c->cd(1);
hist_pions->Draw();

c->cd(2);
hist_kaons->Draw();

c->cd(3);
hist_protons->Draw();

c->SaveAs("Results.pdf");
c->SaveAs("Results.eps");
//c->SaveAs("Results.png");  //error in making png for some reason on my system
c->SaveAs("Results.C");


cout << "Average pT for the whole dataset:" << endl;
cout << Form("o pions     = %f GeV/c",hist_pions->GetMean()) << endl;
cout << Form("o kaons     = %f GeV/c",hist_kaons->GetMean()) << endl;
cout << Form("o protons   = %f GeV/c",hist_protons->GetMean()) << endl;
return 0;
}
