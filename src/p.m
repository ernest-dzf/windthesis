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



% redundancy=[1 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5 1.55 1.6 1.65];
% throughput=[1.46 2.01 7.33 30.9 43.3 43.8 45.4 44.1 42.7 41.3 41.0 40.5 39.0 38.3];
% for i=1:1:14
%     throughput(i)=throughput(i)/4;
% end
% set(gca,'FontSize',30);
% plot(redundancy,throughput,'b*-','LineWidth',2);
% axis([1 1.65 0 15]);
% xlabel('\fontsize {30}冗余度因子（R）');
% ylabel('\fontsize {30}吞吐率(Mbps)');
% set(gca,'XTick',1:0.1:1.65);
% legend('TCP/NC');



% loss_rate=[0 1 2 3 5 8 10 13 15 20 25];
% tcp_rate=[95.3 34.9 23.8 17.4 9.37 3.35 1.95 0.9 0.593 0.114 0.008];
% pp=55.8/48.7;
% cankao=[48.7 48.3 47.4 45.8 43.7 38.8 36.3 35.6 33.3 29.0 24.3];
% for i=1:1:11
%     cankao(i)=cankao(i)*pp;
% end
% 
% tcpnc_rate=zeros(1,11);
% tcpnc_rate(1)=13.0;
% for i =2:1:11
%     tcpnc_rate(i)=tcpnc_rate(i-1)*(cankao(i)/cankao(i-1));
% end
% plot(loss_rate,tcp_rate,'b*-','LineWidth',2);
% hold;
% plot(loss_rate,tcpnc_rate,'r^-','LineWidth',2);
% set(gca,'FontSize',30);
% axis([0 25 0 100]);
% xlabel('\fontsize {30}丢包率（%）');
% ylabel('\fontsize {30}吞吐率(Mbps)');
% legend('TCP','TCP/NC');


% 
% loss_rate=[0 1 2 3 5 8 10 13 15 20 25];
% tcp_rate=[95.3 34.9 23.8 17.4 9.37 3.35 1.95 0.9 0.593 0.114 0.008];
% pp=55.8/48.7;
% cankao=[48.7 48.3 47.4 45.8 43.7 38.8 36.3 35.6 33.3 29.0 24.3];
% for i=1:1:11
%     cankao(i)=cankao(i)*pp;
% end
% 
% etcpnc_rate=zeros(1,11);
% etcpnc_rate(1)=13.0;
% tcpnc_rate=[43.8 47.2 46.3 46.1 46.0 41.8 31.9  15.4 8.63 1.33 1.07];
% for i =2:1:11
%     etcpnc_rate(i)=etcpnc_rate(i-1)*(cankao(i)/cankao(i-1));
% end
% 
% for i = 1:1:11
%     tcpnc_rate(i) = tcpnc_rate(i) /3.6;
% end
% plot(loss_rate,tcp_rate,'bo-','LineWidth',2);
% hold on;
% plot(loss_rate,etcpnc_rate,'rs-','LineWidth',2);
% hold on;
% plot(loss_rate,tcpnc_rate,'g^-','LineWidth',2);
% set(gca,'FontSize',30);
% axis([0 25 0 100]);
% xlabel('\fontsize {30}丢包率（%）');
% ylabel('\fontsize {30}吞吐率(Mbps)');
% legend('TCP','E-TCP/NC','TCP/NC(R=1.3)');


clc;

clc;
clear all;

tcpnc = importdata('mes.txt');
tcpnc = tcpnc';
tcpnc = tcpnc(1:2800);
e_tcpnc = importdata('mes4.txt');
e_tcpnc = e_tcpnc';
e_tcpnc = e_tcpnc(1:2800);

%%y=filter(num,den,e_tcpnc);
%%处理e_tcpnc
% for i=3:1:1300
%     if(e_tcpnc(i) > e_tcpnc(i-1))
%         retran = e_tcpnc(i) - e_tcpnc(i-1);
%     end
% end
subplot(2,1,1);
set(gca,'FontSize',16);
plot(tcpnc,'b','LineWidth',1);
set(gca,'xtick',-inf:inf:inf);
axis([0 1300 0 10]);
ylabel('\fontsize {20}Mat\_loss');
legend('TCP/NC');
%%hold on;
subplot(2,1,2);
plot(e_tcpnc,'r','LineWidth',1);
axis([0 1300 0 10]);
set(gca,'FontSize',16);
xlabel('\fontsize {20}num');
ylabel('\fontsize {20}mat\_loss');
legend('E-TCP/NC');

