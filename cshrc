#.cshrc
setenv SNPSLMD_LICENSE_FILE 27020@14.139.1.126
setenv SENTAURUS /home/usr/sentaurus/W-2024.09
setenv VERDI /home/usr/verdi/X-2025.06-1
setenv VCS /home/usr/vcs/X-2025.06-1
setenv SPYGLASS_HOME /home/usr/spyglass/X-2025.06-1/SPYGLASS_HOME
setenv VC_STATIC /home/usr/vc_static/W-2024.09-2
setenv Design_compiler /home/usr/syn/W-2024.09-SP4
setenv ICC2 /home/usr/icc2/W-2024.09-SP2
setenv VCS_HOME /home/usr/vcs/X-2025.06-1
setenv NOVAS_HOME /home/usr/verdi/X-2025.06-1
setenv VERDI_HOME /home/usr/verdi/X-2025.06-1
setenv SENTAURUS /home/vlsi01/Sent_Tool/sentaurus/X-2025.09


## for example setenv PRIMETIME/<install-dir>/PT-2022.12/prime/U-2022.12

set path=($SENTAURUS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VERDI/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VCS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($SPYGLASS/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($VC_STATIC/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
setenv FLEXLM_DIAGNOSTICS 3
set path=($Design_compiler/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path=($ICC2/bin /usr/local/bin /bin /sbin /usr/bin /usr/local/bin /usr/local/sbin /usr/bin/X11 /usr/X11R6/lib/X11 /usr/X11R6/bin. $path)
set path = ( $VCS/bin $path )
set path=($VERDI/bin $path)
set path = ($SPYGLASS_HOME/bin $path)
set path = ( $SENTAURUS/bin $path )


# Sentaurus GUI Graphics Settings
setenv QT_OPENGL software
setenv LIBGL_ALWAYS_SOFTWARE 1
setenv QT_XCB_GL_INTEGRATION none

echo "done sourcing Synopsys"


