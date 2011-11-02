package Brownie::XPath;

use strict;
use warnings;
use HTML::Selector::XPath ();

sub to_xpath {
    my $locator = shift;
    # taken from Web::Scraper
    return $locator =~ m!^(?:/|id\()!
        ? $locator # XPath
        : HTML::Selector::XPath::selector_to_xpath($locator); # CSS to XPath
}

sub to_link {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//a[@id='%s']!,
        q!//a[text()='%s']!,
        q!//a[@title='%s']!,
        q!//a//img[@alt='%s']!,
    );
}

sub to_button {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//input[(@type='submit' or @type='button' or @type='image') and @id='%s']!,
        q!//input[(@type='submit' or @type='button' or @type='image') and @value='%s']!,
        q!//input[(@type='submit' or @type='button' or @type='image') and @title='%s']!,
        q!//input[@type='image' and @alt='%s']!,
        q!//button[@id='%s']!,
        q!//button[@value='%s']!,
        q!//button[@title='%s']!,
        q!//button[text()='%s']!,
    );
}

sub to_text_field {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//input[(@type='text' or @type='password') and @id='%s']!,
        q!//input[(@type='text' or @type='password') and @name='%s']!,
        q!//input[(@type='text' or @type='password') and @id=//label[text()='%s']/@for]!,
        q!//label[text()='%s']//input[(@type='text' or @type='password')]!,
        q!//input[(@type='text' or @type='password') and @title='%s']!,
        q!//textarea[@id='%s']!,
        q!//textarea[@name='%s']!,
        q!//textarea[@id=//label[text()='%s']/@for]!,
        q!//label[text()='%s']//textarea!,
        q!//textarea[@title='%s']!,
    );
}

sub to_radio {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//input[@type='radio' and @id='%s']!,
        q!//input[@type='radio' and @name='%s']!,
        q!//input[@type='radio' and @id=//label[text()='%s']/@for]!,
        q!//label[text()='%s']//input[@type='radio']!,
        q!//input[@type='radio' and @value='%s']!,
        q!//input[@type='radio' and @title='%s']!,
    );
}

sub to_checkbox {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//input[@type='checkbox' and @id='%s']!,
        q!//input[@type='checkbox' and @name='%s']!,
        q!//input[@type='checkbox' and @id=//label[text()='%s']/@for]!,
        q!//label[text()='%s']//input[@type='checkbox']!,
        q!//input[@type='checkbox' and @value='%s']!,
        q!//input[@type='checkbox' and @title='%s']!,
    );
}

sub to_option {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//option[@id='%s']!,
        q!//option[@name='%s']!,
        q!//option[text()='%s']!,
        q!//option[@value='%s']!,
        q!//option[@title='%s']!,
    );
}

sub to_file_field {
    my $locator = shift;
    return join '|', map { sprintf $_, $locator } (
        q!//input[@type='file' and @id='%s']!,
        q!//input[@type='file' and @name='%s']!,
        q!//input[@type='file' and @id=//label[text()='%s']/@for]!,
        q!//label[text()='%s']//input[@type='file']!,
        q!//input[@type='file' and @title='%s']!,
    );
}

1;

=head1 NAME

Brownie::XPath

=head1 AUTHOR

NAKAGAWA Masaki E<lt>masaki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Brownie::Session>

=cut
