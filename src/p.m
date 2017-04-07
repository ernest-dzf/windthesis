% loss_rate=[0 5 10 15 20 25 30 35 40 45];
% throughput_vegas=[20 5 2 1 0.8 0.4 0.1 0.03 0.01 0.01];
% throughput_nc=[19 17 18 16 14 13 11 10 9 8];
% throughput_ranc=[20 19 18 17 16 15 14 13 12 11];
% set(gca,'FontSize',30);
% 
% plot(loss_rate,throughput_nc,loss_rate,throughput_vegas,loss_rate,throughput_ranc,'LineWidth',2);
% axis([0 45 0 20]);
% xlabel('\fontsize {30}丢包率(%)');
% ylabel('\fontsize {30}吞吐率(Mbps)');
% legend('TCP/NC','TCP-Vegas','AR-NCaTCP');
redundancy=[1 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5 1.55 1.6 1.65];
throughput=[1.46 2.01 7.33 30.9 43.3 43.8 45.4 44.1 42.7 41.3 41.0 40.5 39.0 38.3];
for i=1:1:14
    throughput(i)=throughput(i)/4;
end
set(gca,'FontSize',30);
plot(redundancy,throughput,'b*-','LineWidth',2);
axis([1 1.65 0 15]);
xlabel('\fontsize {30}冗余度因子（R）');
ylabel('\fontsize {30}吞吐率(Mbps)');
set(gca,'XTick',1:0.1:1.65);
legend('TCP/NC');