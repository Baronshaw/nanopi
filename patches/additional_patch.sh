find . -type f -name nft-qos.config | xargs sed -i "s/option limit_enable '1'/option limit_enable '0'/"
sed -i 's/192.168.1.1/192.168.2.1/' package/base-files/files/bin/config_generate
sed -i 's/1400000/1450000/' target/linux/rockchip/patches-5.4/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
truncate -s-1 package/feeds/luci/luci-app-cpufreq/root/etc/config/cpufreq
echo -e "\toption governor0 'schedutil'" >> package/feeds/luci/luci-app-cpufreq/root/etc/config/cpufreq
echo -e "\toption minfreq0 '816000'" >> package/feeds/luci/luci-app-cpufreq/root/etc/config/cpufreq
echo -e "\toption maxfreq0 '1512000'\n" >> package/feeds/luci/luci-app-cpufreq/root/etc/config/cpufreq

#SWAP LAN WAN 满足千兆场景
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network
