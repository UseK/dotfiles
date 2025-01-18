# https://flaky.build/built-in-workaround-for-applications-hiding-under-the-macbook-pro-notch
# https://zenn.dev/mahata/articles/macbook-notch-fix-for-menu-icons
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 9
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 9
# Revert to the original values
# defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
# defaults -currentHost delete -globalDomain NSStatusItemSpacing

# After running these commands, you need to log out and log back in
