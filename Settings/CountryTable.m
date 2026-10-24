#import "CountryTable.h"

@interface CountryTable () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *regionTitles; // Holds the country names
@property (nonatomic, strong) NSArray *regionCodes;  // Holds the dictionaries of country details
@property (nonatomic, strong) UITableView *tableView; // The table view to show the list

@end
@interface AWEStoreRegionChangeManager: NSObject 
- (void)p_showStoreRegionChangedDialog;
+ (id)sharedInstance;
@end
@implementation CountryTable

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"切换地区";
    self.regionTitles = @[@"沙特阿拉伯 🇸🇦", @"中国台湾 🇹🇼", @"中国香港 🇭🇰", @"中国澳门 🇲🇴", @"日本 🇯🇵", @"韩国 🇰🇷", @"英国 🇬🇧", @"美国 🇺🇸", @"澳大利亚 🇦🇺", @"加拿大 🇨🇦", @"阿根廷 🇦🇷", @"菲律宾 🇵🇭", @"老挝 🇱🇦", @"马来西亚 🇲🇾", @"泰国 🇹🇭", @"新加坡 🇸🇬", @"印度尼西亚 🇮🇩", @"越南 🇻🇳", @"安圭拉 🇦🇮", @"巴拿马 🇵🇦", @"德国 🇩🇪", @"俄罗斯 🇷🇺", @"法国 🇫🇷", @"芬兰 🇫🇮", @"意大利 🇮🇹", @"巴基斯坦 🇵🇰", @"丹麦 🇩🇰", @"挪威 🇳🇴", @"苏丹 🇸🇩", @"罗马尼亚 🇷🇴", @"阿联酋 🇦🇪", @"埃及 🇪🇬", @"黎巴嫩 🇱🇧", @"墨西哥 🇲🇽", @"巴西 🇧🇷", @"土耳其 🇹🇷", @"科威特 🇰🇼", @"阿尔及利亚 🇩🇿"];
    
    self.regionCodes = @[
    @{@"area": @"沙特阿拉伯 🇸🇦", @"name": @"Saudi Arabia", @"code": @"SA", @"mcc": @"420", @"mnc": @"01"},
    @{@"area": @"中国台湾 🇹🇼", @"name": @"Taiwan", @"code": @"TW", @"mcc": @"466", @"mnc": @"01"},
    @{@"area": @"中国香港 🇭🇰", @"name": @"Hong Kong", @"code": @"HK", @"mcc": @"454", @"mnc": @"00"},
    @{@"area": @"中国澳门 🇲🇴", @"name": @"Macao", @"code": @"MO", @"mcc": @"455", @"mnc": @"00"},
    @{@"area": @"日本 🇯🇵", @"name": @"Japan", @"code": @"JP", @"mcc": @"440", @"mnc": @"00"},
    @{@"area": @"韩国 🇰🇷", @"name": @"South Korea", @"code": @"KR", @"mcc": @"450", @"mnc": @"05"},
    @{@"area": @"英国 🇬🇧", @"name": @"United Kingdom", @"code": @"GB", @"mcc": @"234", @"mnc": @"30"},
    @{@"area": @"美国 🇺🇸", @"name": @"United States", @"code": @"US", @"mcc": @"310", @"mnc": @"00"},
    @{@"area": @"澳大利亚 🇦🇺", @"name": @"Australia", @"code": @"AU", @"mcc": @"505", @"mnc": @"02"},
    @{@"area": @"加拿大 🇨🇦", @"name": @"Canada", @"code": @"CA", @"mcc": @"302", @"mnc": @"720"},
    @{@"area": @"阿根廷 🇦🇷", @"name": @"Argentina", @"code": @"AR", @"mcc": @"722", @"mnc": @"07"},
    @{@"area": @"菲律宾 🇵🇭", @"name": @"Philippines", @"code": @"PH", @"mcc": @"515", @"mnc": @"02"},
    @{@"area": @"老挝 🇱🇦", @"name": @"Laos", @"code": @"LA", @"mcc": @"457", @"mnc": @"01"},
    @{@"area": @"马来西亚 🇲🇾", @"name": @"Malaysia", @"code": @"MY", @"mcc": @"502", @"mnc": @"13"},
    @{@"area": @"泰国 🇹🇭", @"name": @"Thailand", @"code": @"TH", @"mcc": @"520", @"mnc": @"18"},
    @{@"area": @"新加坡 🇸🇬", @"name": @"Singapore", @"code": @"SG", @"mcc": @"525", @"mnc": @"01"},
    @{@"area": @"印度尼西亚 🇮🇩", @"name": @"Indonesia", @"code": @"ID", @"mcc": @"510", @"mnc": @"01"},
    @{@"area": @"越南 🇻🇳", @"name": @"Vietnam", @"code": @"VN", @"mcc": @"452", @"mnc": @"01"},
    @{@"area": @"安圭拉 🇦🇮", @"name": @"Anguilla", @"code": @"AI", @"mcc": @"365", @"mnc": @"840"},
    @{@"area": @"巴拿马 🇵🇦", @"name": @"Panama", @"code": @"PA", @"mcc": @"714", @"mnc": @"04"},
    @{@"area": @"德国 🇩🇪", @"name": @"Germany", @"code": @"DE", @"mcc": @"262", @"mnc": @"01"},
    @{@"area": @"俄罗斯 🇷🇺", @"name": @"Russia", @"code": @"RU", @"mcc": @"250", @"mnc": @"01"},
    @{@"area": @"法国 🇫🇷", @"name": @"France", @"code": @"FR", @"mcc": @"208", @"mnc": @"10"},
    @{@"area": @"芬兰 🇫🇮", @"name": @"Finland", @"code": @"FI", @"mcc": @"244", @"mnc": @"91"},
    @{@"area": @"意大利 🇮🇹", @"name": @"Italy", @"code": @"IT", @"mcc": @"222", @"mnc": @"10"},
    @{@"area": @"巴基斯坦 🇵🇰", @"name": @"Pakistan", @"code": @"PK", @"mcc": @"410", @"mnc": @"01"},
    @{@"area": @"丹麦 🇩🇰", @"name": @"Denmark", @"code": @"DK", @"mcc": @"238", @"mnc": @"01"},
    @{@"area": @"挪威 🇳🇴", @"name": @"Norway", @"code": @"NO", @"mcc": @"242", @"mnc": @"01"},
    @{@"area": @"苏丹 🇸🇩", @"name": @"Sudan", @"code": @"SD", @"mcc": @"634", @"mnc": @"01"},
    @{@"area": @"罗马尼亚 🇷🇴", @"name": @"Romania", @"code": @"RO", @"mcc": @"226", @"mnc": @"01"},
    @{@"area": @"阿联酋 🇦🇪", @"name": @"United Arab Emirates", @"code": @"AE", @"mcc": @"424", @"mnc": @"02"},
    @{@"area": @"埃及 🇪🇬", @"name": @"Egypt", @"code": @"EG", @"mcc": @"602", @"mnc": @"01"},
    @{@"area": @"黎巴嫩 🇱🇧", @"name": @"Lebanon", @"code": @"LB", @"mcc": @"415", @"mnc": @"01"},
    @{@"area": @"墨西哥 🇲🇽", @"name": @"Mexico", @"code": @"MX", @"mcc": @"334", @"mnc": @"030"},
    @{@"area": @"巴西 🇧🇷", @"name": @"Brazil", @"code": @"BR", @"mcc": @"724", @"mnc": @"06"},
    @{@"area": @"土耳其 🇹🇷", @"name": @"Turkey", @"code": @"TR", @"mcc": @"286", @"mnc": @"01"},
    @{@"area": @"科威特 🇰🇼", @"name": @"Kuwait", @"code": @"KW", @"mcc": @"419", @"mnc": @"02"},
    @{@"area": @"阿尔及利亚 🇩🇿", @"name": @"Algeria", @"code": @"DZ", @"mcc": @"603", @"mnc": @"01"}
];

    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.regionTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.regionTitles[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *selectedRegion = self.regionCodes[indexPath.row];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:selectedRegion forKey:@"region"];
    [defaults synchronize];
    
    NSLog(@"已选地区：%@", selectedRegion);
    [[NSClassFromString(@"AWEStoreRegionChangeManager") sharedInstance] p_showStoreRegionChangedDialog];

}

@end
