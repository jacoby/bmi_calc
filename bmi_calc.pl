#!/usr/bin/perl

use 5.010 ;
use strict ;
use warnings ;

my @height = ( 4 * 12 ) .. ( 7 * 12 ) ; #covering 4ft to 7ft in inches
my @mass = reverse 1 .. 500 ; # mass/weight in lbs

my $constant = 703 ;
my $bmi_hold = '' ;

for my $height ( @height ) {
    say join "\t" , 'inch' , 'lbs' , 'bmi' , 'class' ;
    say '-' x 50 ;
    for my $mass ( @mass ) {

        my $index = ( $mass / ( $height ** 2 ) ) * $constant ;

        my $bmi = check_index( $index ) ;
        my $flag = $bmi eq $bmi_hold ? 1 : 0 ;
        say join "\t" ,
            $height ,
            $mass ,
            int $index ,
            $bmi ,
            if $bmi_hold ne $bmi ;
        $bmi_hold = $bmi ;
        }
    say '' ;
    }

sub check_index {
    my ( $index ) = @_ ;
    if ( $index < 15   ) { return 'very severely underweight' }
    if ( $index < 16   ) { return 'severely underweight' }
    if ( $index < 18.5 ) { return 'underweight' }
    if ( $index < 25   ) { return 'normal' }
    if ( $index < 30   ) { return 'overweight' }
    if ( $index < 35   ) { return 'obese' }
    if ( $index < 40   ) { return 'severely obese' }
    return 'very severely obese' ;
    }
