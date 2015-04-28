//
//  LocalDB.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 08/03/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import "LocalDB.h"
#import "ChampionCategory.h"
#import "ProSummoner.h"

@interface LocalDB ()

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistantStoreCoordinator;

@end

@implementation LocalDB

@synthesize managedObjectModel, managedObjectContext, persistantStoreCoordinator;

- (void) fillDatabase
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *championCategoryDescription = [NSEntityDescription entityForName:@"ChampionCategory" inManagedObjectContext:managedObjectContext];
    NSEntityDescription *proSummonerDescription = [NSEntityDescription entityForName:@"ProSummoner" inManagedObjectContext:managedObjectContext];
    NSError *error;
    NSArray *fetchResult;

    [request setEntity:championCategoryDescription];
    fetchResult = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error || fetchResult.count != 0)
        return ;
    
    ChampionCategory *fighter = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    fighter.categoryName = @"Fighter";
    ChampionCategory *tank = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    tank.categoryName = @"Tank";
    ChampionCategory *support = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    support.categoryName = @"Support";
    ChampionCategory *assassin = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    assassin.categoryName = @"Assassin";
    ChampionCategory *mage = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    mage.categoryName = @"Mage";
    ChampionCategory *marksman = [[ChampionCategory alloc] initWithEntity:championCategoryDescription insertIntoManagedObjectContext:managedObjectContext];
    marksman.categoryName = @"Marksman";
    
    ProSummoner *adrian = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    adrian.region = @"NA";
    adrian.enabled = [NSNumber numberWithBool:YES];
    adrian.idSummoner = [NSNumber numberWithLong:20151025];
    adrian.summonerName = @"TiP Adrian";
    adrian.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *adryh = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    adryh.region = @"EUW";
    adryh.enabled = [NSNumber numberWithBool:YES];
    adryh.idSummoner = [NSNumber numberWithLong:206429];
    adryh.summonerName = @"Giants Adryh";
    adryh.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *airwaks = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    airwaks.region = @"EUW";
    airwaks.enabled = [NSNumber numberWithBool:YES];
    airwaks.idSummoner = [NSNumber numberWithLong:19372857];
    airwaks.summonerName = @"CW Airwaks";
    airwaks.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *alexich = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    alexich.region = @"NA";
    alexich.enabled = [NSNumber numberWithBool:YES];
    alexich.idSummoner = [NSNumber numberWithLong:65009177];
    alexich.summonerName = @"Alex Ich";
    alexich.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *altec = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    altec.region = @"NA";
    altec.enabled = [NSNumber numberWithBool:YES];
    altec.idSummoner = [NSNumber numberWithLong:22140119];
    altec.summonerName = @"WFX Altec";
    altec.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *amazing = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    amazing.region = @"EUW";
    amazing.enabled = [NSNumber numberWithBool:YES];
    amazing.idSummoner = [NSNumber numberWithLong:20605205];
    amazing.summonerName = @"OG Amazing";
    amazing.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *aphromoo = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    aphromoo.region = @"NA";
    aphromoo.enabled = [NSNumber numberWithBool:YES];
    aphromoo.idSummoner = [NSNumber numberWithLong:442232];
    aphromoo.summonerName = @"CLG aphromoo";
    aphromoo.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *apollo = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    apollo.region = @"NA";
    apollo.enabled = [NSNumber numberWithBool:YES];
    apollo.idSummoner = [NSNumber numberWithLong:7250];
    apollo.summonerName = @"TiP apollo";
    apollo.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *arrow = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    arrow.region = @"KR";
    arrow.enabled = [NSNumber numberWithBool:YES];
    arrow.idSummoner = [NSNumber numberWithLong:23764177];
    arrow.summonerName = @"KT Rolster Arrow";
    arrow.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *balls = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    balls.region = @"NA";
    balls.enabled = [NSNumber numberWithBool:YES];
    balls.idSummoner = [NSNumber numberWithLong:19203113];
    balls.summonerName = @"C9 Balls";
    balls.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *bang = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bang.region = @"KR";
    bang.enabled = [NSNumber numberWithBool:YES];
    bang.idSummoner = [NSNumber numberWithLong:7895259];
    bang.summonerName = @"SKT T1 Bang";
    bang.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *bengi = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bengi.region = @"KR";
    bengi.enabled = [NSNumber numberWithBool:YES];
    bengi.idSummoner = [NSNumber numberWithLong:1255867];
    bengi.summonerName = @"SKT T1 Bengi";
    bengi.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *benny = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    benny.region = @"NA";
    benny.enabled = [NSNumber numberWithBool:YES];
    benny.idSummoner = [NSNumber numberWithLong:20974842];
    benny.summonerName = @"Benny";
    benny.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *bischu = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bischu.region = @"NA";
    bischu.enabled = [NSNumber numberWithBool:YES];
    bischu.idSummoner = [NSNumber numberWithLong:20851493];
    bischu.summonerName = @"Bischu";
    bischu.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *bjergsen = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bjergsen.region = @"NA";
    bjergsen.enabled = [NSNumber numberWithBool:YES];
    bjergsen.idSummoner = [NSNumber numberWithLong:49159160];
    bjergsen.summonerName = @"TSM Bjergsen";
    bjergsen.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *bloodwater = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bloodwater.region = @"NA";
    bloodwater.enabled = [NSNumber numberWithBool:YES];
    bloodwater.idSummoner = [NSNumber numberWithLong:21600556];
    bloodwater.summonerName = @"Bloodwater";
    bloodwater.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *boxbox = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    boxbox.region = @"NA";
    boxbox.enabled = [NSNumber numberWithBool:YES];
    boxbox.idSummoner = [NSNumber numberWithLong:245353];
    boxbox.summonerName = @"BoxBox";
    boxbox.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *brokenshard = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    brokenshard.region = @"EUW";
    brokenshard.enabled = [NSNumber numberWithBool:YES];
    brokenshard.idSummoner = [NSNumber numberWithLong:19370101];
    brokenshard.summonerName = @"d Brokenshard";
    brokenshard.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *bunnyfufu = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    bunnyfufu.region = @"NA";
    bunnyfufu.enabled = [NSNumber numberWithBool:YES];
    bunnyfufu.idSummoner = [NSNumber numberWithLong:20441329];
    bunnyfufu.summonerName = @"GV Bunny FuFuu";
    bunnyfufu.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *cain = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cain.region = @"KR";
    cain.enabled = [NSNumber numberWithBool:YES];
    cain.idSummoner = [NSNumber numberWithLong:1407660];
    cain.summonerName = @"Najin Cain";
    cain.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *candypanda = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    candypanda.region = @"EUW";
    candypanda.enabled = [NSNumber numberWithBool:YES];
    candypanda.idSummoner = [NSNumber numberWithLong:284678];
    candypanda.summonerName = @"Candy Panda";
    candypanda.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *celaver = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    celaver.region = @"EUW";
    celaver.enabled = [NSNumber numberWithBool:YES];
    celaver.idSummoner = [NSNumber numberWithLong:19243648];
    celaver.summonerName = @"ROC celaver";
    celaver.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *chaox = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    chaox.region = @"NA";
    chaox.enabled = [NSNumber numberWithBool:YES];
    chaox.idSummoner = [NSNumber numberWithLong:7460];
    chaox.summonerName = @"chaox";
    chaox.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *chaser = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    chaser.region = @"KR";
    chaser.enabled = [NSNumber numberWithBool:YES];
    chaser.idSummoner = [NSNumber numberWithLong:7941870];
    chaser.summonerName = @"Jin Air Chaser";
    chaser.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *chei = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    chei.region = @"KR";
    chei.enabled = [NSNumber numberWithBool:YES];
    chei.idSummoner = [NSNumber numberWithLong:1620025];
    chei.summonerName = @"Jin Air Chei";
    chei.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *coco = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    coco.region = @"KR";
    coco.enabled = [NSNumber numberWithBool:YES];
    coco.idSummoner = [NSNumber numberWithLong:23793873];
    coco.summonerName = @"Xenics Coco";
    coco.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *cop = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cop.region = @"NA";
    cop.enabled = [NSNumber numberWithBool:YES];
    cop.idSummoner = [NSNumber numberWithLong:44979332];
    cop.summonerName = @"GV Cop";
    cop.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *cptjack = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cptjack.region = @"KR";
    cptjack.enabled = [NSNumber numberWithBool:YES];
    cptjack.idSummoner = [NSNumber numberWithLong:30897476];
    cptjack.summonerName = @"Jin Air Cpt Jack";
    cptjack.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *creaton = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    creaton.region = @"EUW";
    creaton.enabled = [NSNumber numberWithBool:YES];
    creaton.idSummoner = [NSNumber numberWithLong:22430915];
    creaton.summonerName = @"Creaton";
    creaton.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *cris = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cris.region = @"NA";
    cris.enabled = [NSNumber numberWithBool:YES];
    cris.idSummoner = [NSNumber numberWithLong:19770082];
    cris.summonerName = @"CST Cris";
    cris.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *crumbzz = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    crumbzz.region = @"NA";
    crumbzz.enabled = [NSNumber numberWithBool:YES];
    crumbzz.idSummoner = [NSNumber numberWithLong:20239565];
    crumbzz.summonerName = @"Crumbzz";
    crumbzz.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *cruzerthebruzer = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cruzerthebruzer.region = @"NA";
    cruzerthebruzer.enabled = [NSNumber numberWithBool:YES];
    cruzerthebruzer.idSummoner = [NSNumber numberWithLong:23297940];
    cruzerthebruzer.summonerName = @"Cruzerthebruzer";
    cruzerthebruzer.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *cyanide = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    cyanide.region = @"EUW";
    cyanide.enabled = [NSNumber numberWithBool:YES];
    cyanide.idSummoner = [NSNumber numberWithLong:19025808];
    cyanide.summonerName = @"OG Cyanide";
    cyanide.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *dandinh = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    dandinh.region = @"NA";
    dandinh.enabled = [NSNumber numberWithBool:YES];
    dandinh.idSummoner = [NSNumber numberWithLong:16685];
    dandinh.summonerName = @"Dan Dinh";
    dandinh.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *darien = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    darien.region = @"EUW";
    darien.enabled = [NSNumber numberWithBool:YES];
    darien.idSummoner = [NSNumber numberWithLong:295022];
    darien.summonerName = @"Darien";
    darien.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *daydreamin = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    daydreamin.region = @"NA";
    daydreamin.enabled = [NSNumber numberWithBool:YES];
    daydreamin.idSummoner = [NSNumber numberWithLong:19602876];
    daydreamin.summonerName = @"Daydreamin";
    daydreamin.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *dexter = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    dexter.region = @"EUW";
    dexter.enabled = [NSNumber numberWithBool:YES];
    dexter.idSummoner = [NSNumber numberWithLong:19525181];
    dexter.summonerName = @"Dexter";
    dexter.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *diamondprox = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    diamondprox.region = @"EUW";
    diamondprox.enabled = [NSNumber numberWithBool:YES];
    diamondprox.idSummoner = [NSNumber numberWithLong:20042258];
    diamondprox.summonerName = @"Diamondprox";
    diamondprox.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *dodo = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    dodo.region = @"NA";
    dodo.enabled = [NSNumber numberWithBool:YES];
    dodo.idSummoner = [NSNumber numberWithLong:19245823];
    dodo.summonerName = @"Dodo8";
    dodo.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *doublelift = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    doublelift.region = @"NA";
    doublelift.enabled = [NSNumber numberWithBool:YES];
    doublelift.idSummoner = [NSNumber numberWithLong:20132258];
    doublelift.summonerName = @"Doublelift";
    doublelift.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *duke = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    duke.region = @"KR";
    duke.enabled = [NSNumber numberWithBool:YES];
    duke.idSummoner = [NSNumber numberWithLong:2854950];
    duke.summonerName = @"Duke";
    duke.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *dyrus = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    dyrus.region = @"NA";
    dyrus.enabled = [NSNumber numberWithBool:YES];
    dyrus.idSummoner = [NSNumber numberWithLong:5908];
    dyrus.summonerName = @"Dyrus";
    dyrus.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *easyhoon = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    easyhoon.region = @"KR";
    easyhoon.enabled = [NSNumber numberWithBool:YES];
    easyhoon.idSummoner = [NSNumber numberWithLong:2060871];
    easyhoon.summonerName = @"SKT T1 Eazyhoon";
    easyhoon.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *edward = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    edward.region = @"EUW";
    edward.enabled = [NSNumber numberWithBool:YES];
    edward.idSummoner = [NSNumber numberWithLong:37802535];
    edward.summonerName = @"Edward";
    edward.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *fakersenpai = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    fakersenpai.region = @"KR";
    fakersenpai.enabled = [NSNumber numberWithBool:YES];
    fakersenpai.idSummoner = [NSNumber numberWithLong:1135567];
    fakersenpai.summonerName = @"SKT T1 Faker";
    fakersenpai.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *febiven = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    febiven.region = @"EUW";
    febiven.enabled = [NSNumber numberWithBool:YES];
    febiven.idSummoner = [NSNumber numberWithLong:30657524];
    febiven.summonerName = @"Febiven";
    febiven.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *fenix = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    fenix.region = @"NA";
    fenix.enabled = [NSNumber numberWithBool:YES];
    fenix.idSummoner = [NSNumber numberWithLong:60939398];
    fenix.summonerName = @"Liquid FeniX";
    fenix.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *fly = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    fly.region = @"KR";
    fly.enabled = [NSNumber numberWithBool:YES];
    fly.idSummoner = [NSNumber numberWithLong:2706560];
    fly.summonerName = @"Fly";
    fly.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *forgiven = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    forgiven.region = @"EUW";
    forgiven.enabled = [NSNumber numberWithBool:YES];
    forgiven.idSummoner = [NSNumber numberWithLong:40101302];
    forgiven.summonerName = @"FORG1VEN";
    forgiven.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *fox = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    fox.region = @"EUW";
    fox.enabled = [NSNumber numberWithBool:YES];
    fox.idSummoner = [NSNumber numberWithLong:27550839];
    fox.summonerName = @"Fox";
    fox.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *fredy122 = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    fredy122.region = @"EUW";
    fredy122.enabled = [NSNumber numberWithBool:YES];
    fredy122.idSummoner = [NSNumber numberWithLong:19286794];
    fredy122.summonerName = @"Fredy122";
    fredy122.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *froggen = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    froggen.region = @"EUW";
    froggen.enabled = [NSNumber numberWithBool:YES];
    froggen.idSummoner = [NSNumber numberWithLong:19531813];
    froggen.summonerName = @"Froggen";
    froggen.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *frommaplestreet = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    frommaplestreet.region = @"NA";
    frommaplestreet.enabled = [NSNumber numberWithBool:YES];
    frommaplestreet.idSummoner = [NSNumber numberWithLong:31804754];
    frommaplestreet.summonerName = @"Frommaplestreet";
    frommaplestreet.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *genja = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    genja.region = @"EUW";
    genja.enabled = [NSNumber numberWithBool:YES];
    genja.idSummoner = [NSNumber numberWithLong:19507571];
    genja.summonerName = @"Genja";
    genja.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *ggoong = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    ggoong.region = @"KR";
    ggoong.enabled = [NSNumber numberWithBool:YES];
    ggoong.idSummoner = [NSNumber numberWithLong:4959450];
    ggoong.summonerName = @"Ggoong";
    ggoong.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *gleebglarbu = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    gleebglarbu.region = @"NA";
    gleebglarbu.enabled = [NSNumber numberWithBool:YES];
    gleebglarbu.idSummoner = [NSNumber numberWithLong:22777955];
    gleebglarbu.summonerName = @"Gleebglarbu";
    gleebglarbu.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *goldenglue = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    goldenglue.region = @"NA";
    goldenglue.enabled = [NSNumber numberWithBool:YES];
    goldenglue.idSummoner = [NSNumber numberWithLong:21490433];
    goldenglue.summonerName = @"Goldenglue";
    goldenglue.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *hachani = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    hachani.region = @"KR";
    hachani.enabled = [NSNumber numberWithBool:YES];
    hachani.idSummoner = [NSNumber numberWithLong:1253437];
    hachani.summonerName = @"KT Hachani";
    hachani.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *hai = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    hai.region = @"NA";
    hai.enabled = [NSNumber numberWithBool:YES];
    hai.idSummoner = [NSNumber numberWithLong:492066];
    hai.summonerName = @"C9 Hai";
    hai.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *helios = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    helios.region = @"NA";
    helios.enabled = [NSNumber numberWithBool:YES];
    helios.idSummoner = [NSNumber numberWithLong:55779191];
    helios.summonerName = @"Helios";
    helios.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *hotshot = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    hotshot.region = @"NA";
    hotshot.enabled = [NSNumber numberWithBool:YES];
    hotshot.idSummoner = [NSNumber numberWithLong:407750];
    hotshot.summonerName = @"HotshotGG";
    hotshot.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *iwdominate = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    iwdominate.region = @"NA";
    iwdominate.enabled = [NSNumber numberWithBool:YES];
    iwdominate.idSummoner = [NSNumber numberWithLong:38249375];
    iwdominate.summonerName = @"I Will Dominate";
    iwdominate.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *qtpie = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    qtpie.region = @"NA";
    qtpie.enabled = [NSNumber numberWithBool:YES];
    qtpie.idSummoner = [NSNumber numberWithLong:19887289];
    qtpie.summonerName = @"Imaqtpie";
    qtpie.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *impaler = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    impaler.region = @"NA";
    impaler.enabled = [NSNumber numberWithBool:YES];
    impaler.idSummoner = [NSNumber numberWithLong:61109241];
    impaler.summonerName = @"Impaler";
    impaler.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *innox = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    innox.region = @"NA";
    innox.enabled = [NSNumber numberWithBool:YES];
    innox.idSummoner = [NSNumber numberWithLong:20533973];
    innox.summonerName = @"InnoX";
    innox.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *insec = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    insec.region = @"KR";
    insec.enabled = [NSNumber numberWithBool:YES];
    insec.idSummoner = [NSNumber numberWithLong:1567183];
    insec.summonerName = @"Insec";
    insec.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *jankos = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    jankos.region = @"EUW";
    jankos.enabled = [NSNumber numberWithBool:YES];
    jankos.idSummoner = [NSNumber numberWithLong:21071845];
    jankos.summonerName = @"ROCCAT Jankos";
    jankos.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *jesiz = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    jesiz.region = @"EUW";
    jesiz.enabled = [NSNumber numberWithBool:YES];
    jesiz.idSummoner = [NSNumber numberWithLong:20828788];
    jesiz.summonerName = @"Jesiz";
    jesiz.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *jree = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    jree.region = @"EUW";
    jree.enabled = [NSNumber numberWithBool:YES];
    jree.idSummoner = [NSNumber numberWithLong:20371233];
    jree.summonerName = @"Jree";
    jree.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *kakao = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kakao.region = @"KR";
    kakao.enabled = [NSNumber numberWithBool:YES];
    kakao.idSummoner = [NSNumber numberWithLong:1344293];
    kakao.summonerName = @"KaKAO";
    kakao.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *keane = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    keane.region = @"NA";
    keane.enabled = [NSNumber numberWithBool:YES];
    keane.idSummoner = [NSNumber numberWithLong:57039082];
    keane.summonerName = @"GV Keane";
    keane.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *kerp = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kerp.region = @"EUW";
    kerp.enabled = [NSNumber numberWithBool:YES];
    kerp.idSummoner = [NSNumber numberWithLong:19154570];
    kerp.summonerName = @"Kerp";
    kerp.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *kevin = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kevin.region = @"EUW";
    kevin.enabled = [NSNumber numberWithBool:YES];
    kevin.idSummoner = [NSNumber numberWithLong:18995872];
    kevin.summonerName = @"Kev1n";
    kevin.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *kez = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kez.region = @"NA";
    kez.enabled = [NSNumber numberWithBool:YES];
    kez.idSummoner = [NSNumber numberWithLong:30783632];
    kez.summonerName = @"Kez";
    kez.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *kikis = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kikis.region = @"EUW";
    kikis.enabled = [NSNumber numberWithBool:YES];
    kikis.idSummoner = [NSNumber numberWithLong:19751358];
    kikis.summonerName = @"Kikis";
    kikis.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *kiwikid = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kiwikid.region = @"NA";
    kiwikid.enabled = [NSNumber numberWithBool:YES];
    kiwikid.idSummoner = [NSNumber numberWithLong:23424599];
    kiwikid.summonerName = @"KiWiKiD";
    kiwikid.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *kottenx = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kottenx.region = @"EUW";
    kottenx.enabled = [NSNumber numberWithBool:YES];
    kottenx.idSummoner = [NSNumber numberWithLong:21882497];
    kottenx.summonerName = @"Kottenx";
    kottenx.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *krepo = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    krepo.region = @"EUW";
    krepo.enabled = [NSNumber numberWithBool:YES];
    krepo.idSummoner = [NSNumber numberWithLong:19307647];
    krepo.summonerName = @"Krepo";
    krepo.categories = [NSSet setWithObjects:support, mage, nil];

    ProSummoner *kuro = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    kuro.region = @"KR";
    kuro.enabled = [NSNumber numberWithBool:YES];
    kuro.idSummoner = [NSNumber numberWithLong:1222794];
    kuro.summonerName = @"KurO";
    kuro.categories = [NSSet setWithObjects:assassin, mage, nil];
    
    ProSummoner *lemonnation = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    lemonnation.region = @"NA";
    lemonnation.enabled = [NSNumber numberWithBool:YES];
    lemonnation.idSummoner = [NSNumber numberWithLong:44979325];
    lemonnation.summonerName = @"C9 LemonNation";
    lemonnation.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *link = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    link.region = @"NA";
    link.enabled = [NSNumber numberWithBool:YES];
    link.idSummoner = [NSNumber numberWithLong:21705406];
    link.summonerName = @"Link";
    link.categories = [NSSet setWithObjects:assassin, mage, nil];
    
    ProSummoner *looper = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    looper.region = @"KR";
    looper.enabled = [NSNumber numberWithBool:YES];
    looper.idSummoner = [NSNumber numberWithLong:4063073];
    looper.summonerName = @"Looper";
    looper.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *loulex = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    loulex.region = @"EUW";
    loulex.enabled = [NSNumber numberWithBool:YES];
    loulex.idSummoner = [NSNumber numberWithLong:20050482];
    loulex.summonerName = @"Loulex";
    loulex.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *lustboy = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    lustboy.region = @"NA";
    lustboy.enabled = [NSNumber numberWithBool:YES];
    lustboy.idSummoner = [NSNumber numberWithLong:56917699];
    lustboy.summonerName = @"Lustboy";
    lustboy.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *madlife = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    madlife.region = @"KR";
    madlife.enabled = [NSNumber numberWithBool:YES];
    madlife.idSummoner = [NSNumber numberWithLong:2060159];
    madlife.summonerName = @"Madlife";
    madlife.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *mafa = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    mafa.region = @"KR";
    mafa.enabled = [NSNumber numberWithBool:YES];
    mafa.idSummoner = [NSNumber numberWithLong:1130609];
    mafa.summonerName = @"Mafa";
    mafa.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *mancloud = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    mancloud.region = @"NA";
    mancloud.enabled = [NSNumber numberWithBool:YES];
    mancloud.idSummoner = [NSNumber numberWithLong:200553];
    mancloud.summonerName = @"Mancloud";
    mancloud.categories = [NSSet setWithObjects:assassin, mage, nil];
    
    ProSummoner *marin = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    marin.region = @"KR";
    marin.enabled = [NSNumber numberWithBool:YES];
    marin.idSummoner = [NSNumber numberWithLong:3649533];
    marin.summonerName = @"MaRin";
    marin.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *megazero = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    megazero.region = @"NA";
    megazero.enabled = [NSNumber numberWithBool:YES];
    megazero.idSummoner = [NSNumber numberWithLong:4297];
    megazero.summonerName = @"MegaZero";
    megazero.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *meteos = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    meteos.region = @"NA";
    meteos.enabled = [NSNumber numberWithBool:YES];
    meteos.idSummoner = [NSNumber numberWithLong:390600];
    meteos.summonerName = @"Meteos";
    meteos.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *moopz = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    moopz.region = @"EUW";
    moopz.enabled = [NSNumber numberWithBool:YES];
    moopz.idSummoner = [NSNumber numberWithLong:19642904];
    moopz.summonerName = @"Moopz";
    moopz.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *mrrallez = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    mrrallez.region = @"EUW";
    mrrallez.enabled = [NSNumber numberWithBool:YES];
    mrrallez.idSummoner = [NSNumber numberWithLong:21714748];
    mrrallez.summonerName = @"MrRalleZ";
    mrrallez.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *nagne = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nagne.region = @"KR";
    nagne.enabled = [NSNumber numberWithBool:YES];
    nagne.idSummoner = [NSNumber numberWithLong:2006507];
    nagne.summonerName = @"Nagne";
    nagne.categories = [NSSet setWithObjects:assassin, mage, nil];
    
    ProSummoner *nientonsoh = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nientonsoh.region = @"NA";
    nientonsoh.enabled = [NSNumber numberWithBool:YES];
    nientonsoh.idSummoner = [NSNumber numberWithLong:21622356];
    nientonsoh.summonerName = @"Nien";
    nientonsoh.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *nightblue = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nightblue.region = @"NA";
    nightblue.enabled = [NSNumber numberWithBool:YES];
    nightblue.idSummoner = [NSNumber numberWithLong:25850956];
    nightblue.summonerName = @"Nightblue3";
    nightblue.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *nintendudex = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nintendudex.region = @"NA";
    nintendudex.enabled = [NSNumber numberWithBool:YES];
    nintendudex.idSummoner = [NSNumber numberWithLong:74673];
    nintendudex.summonerName = @"NintendudeX";
    nintendudex.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *nofe = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nofe.region = @"KR";
    nofe.enabled = [NSNumber numberWithBool:YES];
    nofe.idSummoner = [NSNumber numberWithLong:1420721];
    nofe.summonerName = @"Nofe";
    nofe.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *nrated = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nrated.region = @"EUW";
    nrated.enabled = [NSNumber numberWithBool:YES];
    nrated.idSummoner = [NSNumber numberWithLong:394076];
    nrated.summonerName = @"nRated";
    nrated.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *nukeduck = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nukeduck.region = @"EUW";
    nukeduck.enabled = [NSNumber numberWithBool:YES];
    nukeduck.idSummoner = [NSNumber numberWithLong:19859377];
    nukeduck.summonerName = @"Nukeduck";
    nukeduck.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *nyph = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    nyph.region = @"EUW";
    nyph.enabled = [NSNumber numberWithBool:YES];
    nyph.idSummoner = [NSNumber numberWithLong:309109];
    nyph.summonerName = @"Nyph";
    nyph.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *odoamne = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    odoamne.region = @"EUW";
    odoamne.enabled = [NSNumber numberWithBool:YES];
    odoamne.idSummoner = [NSNumber numberWithLong:21001130];
    odoamne.summonerName = @"Odoamne";
    odoamne.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *ohq = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    ohq.region = @"KR";
    ohq.enabled = [NSNumber numberWithBool:YES];
    ohq.idSummoner = [NSNumber numberWithLong:17140249];
    ohq.summonerName = @"Ohq";
    ohq.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *overpow = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    overpow.region = @"EUW";
    overpow.enabled = [NSNumber numberWithBool:YES];
    overpow.idSummoner = [NSNumber numberWithLong:19479122];
    overpow.summonerName = @"Overpow";
    overpow.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *pinoy = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    pinoy.region = @"EUW";
    pinoy.enabled = [NSNumber numberWithBool:YES];
    pinoy.idSummoner = [NSNumber numberWithLong:20906293];
    pinoy.summonerName = @"P1noy";
    pinoy.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *pepinero = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    pepinero.region = @"EUW";
    pepinero.enabled = [NSNumber numberWithBool:YES];
    pepinero.idSummoner = [NSNumber numberWithLong:19806326];
    pepinero.summonerName = @"Pepinero";
    pepinero.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *pobelter = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    pobelter.region = @"NA";
    pobelter.enabled = [NSNumber numberWithBool:YES];
    pobelter.idSummoner = [NSNumber numberWithLong:2648];
    pobelter.summonerName = @"Pobelter";
    pobelter.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *poohmandu = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    poohmandu.region = @"KR";
    poohmandu.enabled = [NSNumber numberWithBool:YES];
    poohmandu.idSummoner = [NSNumber numberWithLong:1266976];
    poohmandu.summonerName = @"PoohManDu";
    poohmandu.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *pray = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    pray.region = @"KR";
    pray.enabled = [NSNumber numberWithBool:YES];
    pray.idSummoner = [NSNumber numberWithLong:5194376];
    pray.summonerName = @"PraY";
    pray.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *quas = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    quas.region = @"NA";
    quas.enabled = [NSNumber numberWithBool:YES];
    quas.idSummoner = [NSNumber numberWithLong:20017478];
    quas.summonerName = @"Quas";
    quas.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *reginald = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    reginald.region = @"NA";
    reginald.enabled = [NSNumber numberWithBool:YES];
    reginald.idSummoner = [NSNumber numberWithLong:17772];
    reginald.summonerName = @"Reginald";
    reginald.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *rekkles = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    rekkles.region = @"EUW";
    rekkles.enabled = [NSNumber numberWithBool:YES];
    rekkles.idSummoner = [NSNumber numberWithLong:20717177];
    rekkles.summonerName = @"Rekkles";
    rekkles.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *robertxlee = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    robertxlee.region = @"NA";
    robertxlee.enabled = [NSNumber numberWithBool:YES];
    robertxlee.idSummoner = [NSNumber numberWithLong:21607937];
    robertxlee.summonerName = @"ROBERTxLEE";
    robertxlee.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *rydle = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    rydle.region = @"EUW";
    rydle.enabled = [NSNumber numberWithBool:YES];
    rydle.idSummoner = [NSNumber numberWithLong:19307096];
    rydle.summonerName = @"Rydle";
    rydle.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *saintvicious = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    saintvicious.region = @"NA";
    saintvicious.enabled = [NSNumber numberWithBool:YES];
    saintvicious.idSummoner = [NSNumber numberWithLong:138243];
    saintvicious.summonerName = @"Saintvicious";
    saintvicious.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *save = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    save.region = @"KR";
    save.enabled = [NSNumber numberWithBool:YES];
    save.idSummoner = [NSNumber numberWithLong:2580719];
    save.summonerName = @"Save";
    save.categories = [NSSet setWithObjects:tank, fighter, nil];
    
    ProSummoner *scarra = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    scarra.region = @"NA";
    scarra.enabled = [NSNumber numberWithBool:YES];
    scarra.idSummoner = [NSNumber numberWithLong:10077];
    scarra.summonerName = @"Scarra";
    scarra.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *selfie = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    selfie.region = @"EUW";
    selfie.enabled = [NSNumber numberWithBool:YES];
    selfie.idSummoner = [NSNumber numberWithLong:40560749];
    selfie.summonerName = @"Selfie";
    selfie.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *sheep = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    sheep.region = @"NA";
    sheep.enabled = [NSNumber numberWithBool:YES];
    sheep.idSummoner = [NSNumber numberWithLong:44317220];
    sheep.summonerName = @"Sheep";
    sheep.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *shiphtur = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    shiphtur.region = @"NA";
    shiphtur.enabled = [NSNumber numberWithBool:YES];
    shiphtur.idSummoner = [NSNumber numberWithLong:19967304];
    shiphtur.summonerName = @"Shiphtur";
    shiphtur.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *shook = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    shook.region = @"EUW";
    shook.enabled = [NSNumber numberWithBool:YES];
    shook.idSummoner = [NSNumber numberWithLong:47257274];
    shook.summonerName = @"Shook";
    shook.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *sneaky = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    sneaky.region = @"NA";
    sneaky.enabled = [NSNumber numberWithBool:YES];
    sneaky.idSummoner = [NSNumber numberWithLong:51405];
    sneaky.summonerName = @"Sneaky";
    sneaky.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *soaz = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    soaz.region = @"EUW";
    soaz.enabled = [NSNumber numberWithBool:YES];
    soaz.idSummoner = [NSNumber numberWithLong:372983];
    soaz.summonerName = @"sOAZ";
    soaz.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *space = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    space.region = @"KR";
    space.enabled = [NSNumber numberWithBool:YES];
    space.idSummoner = [NSNumber numberWithLong:1263740];
    space.summonerName = @"Space";
    space.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *ssumday = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    ssumday.region = @"KR";
    ssumday.enabled = [NSNumber numberWithBool:YES];
    ssumday.idSummoner = [NSNumber numberWithLong:1252130];
    ssumday.summonerName = @"Ssumday";
    ssumday.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *steelback = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    steelback.region = @"EUW";
    steelback.enabled = [NSNumber numberWithBool:YES];
    steelback.idSummoner = [NSNumber numberWithLong:83180];
    steelback.summonerName = @"Steelback";
    steelback.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *svenskeren = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    svenskeren.region = @"EUW";
    svenskeren.enabled = [NSNumber numberWithBool:YES];
    svenskeren.idSummoner = [NSNumber numberWithLong:19543261];
    svenskeren.summonerName = @"Svenskeren";
    svenskeren.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *swift = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    swift.region = @"KR";
    swift.enabled = [NSNumber numberWithBool:YES];
    swift.idSummoner = [NSNumber numberWithLong:1730843];
    swift.summonerName = @"Swift";
    swift.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *tabzz = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    tabzz.region = @"EUW";
    tabzz.enabled = [NSNumber numberWithBool:YES];
    tabzz.idSummoner = [NSNumber numberWithLong:19662872];
    tabzz.summonerName = @"Tabzz";
    tabzz.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *theoddone = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    theoddone.region = @"NA";
    theoddone.enabled = [NSNumber numberWithBool:YES];
    theoddone.idSummoner = [NSNumber numberWithLong:60783];
    theoddone.summonerName = @"TheOddOne";
    theoddone.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *trace = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    trace.region = @"KR";
    trace.enabled = [NSNumber numberWithBool:YES];
    trace.idSummoner = [NSNumber numberWithLong:1225219];
    trace.summonerName = @"TrAce";
    trace.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *unlimited = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    unlimited.region = @"EUW";
    unlimited.enabled = [NSNumber numberWithBool:YES];
    unlimited.idSummoner = [NSNumber numberWithLong:20480030];
    unlimited.summonerName = @"Unlimited";
    unlimited.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *vander = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    vander.region = @"EUW";
    vander.enabled = [NSNumber numberWithBool:YES];
    vander.idSummoner = [NSNumber numberWithLong:22329896];
    vander.summonerName = @"Vander";
    vander.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *vizicsacsi = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    vizicsacsi.region = @"EUW";
    vizicsacsi.enabled = [NSNumber numberWithBool:YES];
    vizicsacsi.idSummoner = [NSNumber numberWithLong:26316897];
    vizicsacsi.summonerName = @"Vizicsacsi";
    vizicsacsi.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *voyboy = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    voyboy.region = @"NA";
    voyboy.enabled = [NSNumber numberWithBool:YES];
    voyboy.idSummoner = [NSNumber numberWithLong:19134540];
    voyboy.summonerName = @"Voyboy";
    voyboy.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *watch = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    watch.region = @"KR";
    watch.enabled = [NSNumber numberWithBool:YES];
    watch.idSummoner = [NSNumber numberWithLong:5194906];
    watch.summonerName = @"Watch";
    watch.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *westrice = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    westrice.region = @"NA";
    westrice.enabled = [NSNumber numberWithBool:YES];
    westrice.idSummoner = [NSNumber numberWithLong:19674238];
    westrice.summonerName = @"Westrice";
    westrice.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *wickd = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    wickd.region = @"EUW";
    wickd.enabled = [NSNumber numberWithBool:YES];
    wickd.idSummoner = [NSNumber numberWithLong:71500];
    wickd.summonerName = @"Wickd";
    wickd.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *wildturtle = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    wildturtle.region = @"NA";
    wildturtle.enabled = [NSNumber numberWithBool:YES];
    wildturtle.idSummoner = [NSNumber numberWithLong:18991200];
    wildturtle.summonerName = @"WildTurtle";
    wildturtle.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *wingsofdeathx = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    wingsofdeathx.region = @"NA";
    wingsofdeathx.enabled = [NSNumber numberWithBool:YES];
    wingsofdeathx.idSummoner = [NSNumber numberWithLong:19660288];
    wingsofdeathx.summonerName = @"Wingsofdeathx";
    wingsofdeathx.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *wolf = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    wolf.region = @"KR";
    wolf.enabled = [NSNumber numberWithBool:YES];
    wolf.idSummoner = [NSNumber numberWithLong:4661845];
    wolf.summonerName = @"Wolf";
    wolf.categories = [NSSet setWithObjects:support, mage, nil];
    
    ProSummoner *xaxus = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    xaxus.region = @"EUW";
    xaxus.enabled = [NSNumber numberWithBool:YES];
    xaxus.idSummoner = [NSNumber numberWithLong:19346860];
    xaxus.summonerName = @"Xaxus";
    xaxus.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *xiaoweixiao = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    xiaoweixiao.region = @"NA";
    xiaoweixiao.enabled = [NSNumber numberWithBool:YES];
    xiaoweixiao.idSummoner = [NSNumber numberWithLong:49739407];
    xiaoweixiao.summonerName = @"XiaoWeiXiao";
    xiaoweixiao.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *xpecial = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    xpecial.region = @"NA";
    xpecial.enabled = [NSNumber numberWithBool:YES];
    xpecial.idSummoner = [NSNumber numberWithLong:19199530];
    xpecial.summonerName = @"Xpecial";
    xpecial.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *xpeke = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    xpeke.region = @"EUW";
    xpeke.enabled = [NSNumber numberWithBool:YES];
    xpeke.idSummoner = [NSNumber numberWithLong:174035];
    xpeke.summonerName = @"xPeke";
    xpeke.categories = [NSSet setWithObjects:mage, assassin, nil];
    
    ProSummoner *yellowstar = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    yellowstar.region = @"EUW";
    yellowstar.enabled = [NSNumber numberWithBool:YES];
    yellowstar.idSummoner = [NSNumber numberWithLong:254943];
    yellowstar.summonerName = @"YellOwStaR";
    yellowstar.categories = [NSSet setWithObjects:mage, support, nil];
    
    ProSummoner *youngbuck = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    youngbuck.region = @"EUW";
    youngbuck.enabled = [NSNumber numberWithBool:YES];
    youngbuck.idSummoner = [NSNumber numberWithLong:20289601];
    youngbuck.summonerName = @"YoungBuck";
    youngbuck.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    ProSummoner *zefa = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    zefa.region = @"KR";
    zefa.enabled = [NSNumber numberWithBool:YES];
    zefa.idSummoner = [NSNumber numberWithLong:1419353];
    zefa.summonerName = @"Zefa";
    zefa.categories = [NSSet setWithObjects:marksman, nil];
    
    ProSummoner *zionspartan = [[ProSummoner alloc] initWithEntity:proSummonerDescription insertIntoManagedObjectContext:managedObjectContext];
    zionspartan.region = @"NA";
    zionspartan.enabled = [NSNumber numberWithBool:YES];
    zionspartan.idSummoner = [NSNumber numberWithLong:19738326];
    zionspartan.summonerName = @"ZionSpartan";
    zionspartan.categories = [NSSet setWithObjects:fighter, tank, nil];
    
    if (![managedObjectContext save:&error])
    {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
}

- (id) init
{
    self = [super init];
    
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"LocalDB" ofType:@"momd"]];
    managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
   
    persistantStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    NSURL *dbURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject, DBFILENAME] isDirectory:NO];
    NSDictionary *pragmaOptions = @{ @"synchronous": @"NORMAL" };
    NSDictionary *storeOptions = @{ NSSQLitePragmasOption: pragmaOptions };
    NSError *error = nil;
    if (![persistantStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dbURL options:storeOptions error:&error])
    {
        NSLog(@"Could not open persistant store using type SQLite. Error data : %@, %@", error, [error userInfo]);
        NSLog(@"Trying to open binary persistant store...");
        NSURL *dbBinaryURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject, DBBINARYFILENAME] isDirectory:NO];
        if (![persistantStoreCoordinator addPersistentStoreWithType:NSBinaryStoreType configuration:nil URL:dbBinaryURL options:nil error:&error])
        {
            NSLog(@"Could not open persistant store using type Binary. Error data : %@, %@", error, [error userInfo]);
            NSLog(@"No data will be saved...");
        }
    }
    
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:persistantStoreCoordinator];
    
    [self fillDatabase];
    
    return self;
}

@end
