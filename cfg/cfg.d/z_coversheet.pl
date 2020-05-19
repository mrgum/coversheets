
# Bazaar Configuration

$c->{plugins}{"Convert::AddCoversheet"}{params}{disable} = 0;
$c->{plugins}{"Event::AddCoversheet"}{params}{disable} = 0;
$c->{plugins}{"Screen::Coversheet::Activate"}{params}{disable} = 0;
$c->{plugins}{"Screen::Coversheet::Deprecate"}{params}{disable} = 0;
$c->{plugins}{"Screen::Coversheet::Edit"}{params}{disable} = 0;
$c->{plugins}{"Screen::Coversheet::New"}{params}{disable} = 0;
$c->{plugins}{"Screen::EPMC::Coversheet"}{params}{disable} = 0;



# Stores the id of the Coversheet Dataobj that was used to generated the CS'ed document
push @{$c->{fields}->{document}},
        {
                name => 'coversheetid',
                type => 'int',
        };

# Where the coversheets are stored:
$c->{coversheet}->{path_suffix} = '/coversheets';
$c->{coversheet}->{path} = $c->{archiveroot}.'/cfg/static/coversheets';
$c->{coversheet}->{url} = $c->{base_url}.'/coversheets';

# a choice of stitching tools are gs can cause color space issues
# e.g. eprints.lse.ac.uk/101091
$c->{pdf_stitching_tool} = 'qpdf';
# Ghostscript command to stitch the pdfs if tool is gs
$c->{gs_pdf_stitch_cmd} = "gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=";
# qpdf commands to stitch the pdfs if tool is qpdf
$c->{qpdf_pdf_stitch_cmd} = "qpdf --empty --pages";

# Fields used for applying coversheets
$c->{license_application_fields} = [ "type" ];

#new permissions for coversheet toolkit
$c->{roles}->{"coversheet-editor"} =
[
	"coversheet/destroy",
        "coversheet/write",
        "coversheet/activate",
        "coversheet/deprecate",
        "coversheet/view",
];

push @{$c->{user_roles}->{editor}}, 'coversheet-editor';
push @{$c->{user_roles}->{admin}}, 'coversheet-editor';
push @{$c->{user_roles}->{local_admin}}, 'coversheet-editor';

# Tags may be defined locally, see Plugin/Convert/AddCoversheet.pm
# $c->{coversheet}->{tags} = {};

