






# Reviewer Corrections

# Load in libraries

library(readxl)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(ggfortify)
library(rstatix)
library(corrplot)
library(tidyr)
library(report)
library(ggpubr)



# Load in data
full_set = read_xlsx("C:\\Users\\jramb\\Documents\\Employment\\Dr. George Lab\\Assignments\\Pi Paper\\stats_data\\Results\\final_results\\rpi_master.xlsx")

# Preserve original, make workable data sets
rpi = full_set[1:40 ,c(1:5,10,12,14:29)]
rpi$session <- factor(rpi$session)
rpi$pi_model <- factor(rpi$pi_model)
rpi$time = factor(rpi$time)
rpi_1hr_05 = rpi[1:5, ]
rpi_1hr_10 = rpi[6:15, ]
rpi_2hr_10 = rpi[16:25, ]
rpi_2hr_15 = rpi[26:40, ]
rpi_24hr_15 = full_set[41:55, c(1:5,10,12,14:29)]
rpi_2hr = rpi[16:40, ]
rpi_model = rpi[1:15, ]
rpi_all = rbind(rpi, rpi_24hr_15)
rpi_all$time = factor(rpi_all$time)
rpi_luminance = read_xlsx("C:\\Users\\jramb\\Documents\\Employment\\Dr. George Lab\\Assignments\\Pi Paper\\stats_data\\Results\\final_results\\light_exp.xlsx")

# Colors
sess_colors = c("#41b6c4", "#253494", "#F768A1", "#980043")
time_colors = c("#2C7FB8", "#C51B89")


setwd("C:\\Users\\jramb\\Documents\\Pi_Sub")


# Standard Error of Mean Function
mean_se <- function(x) {
  se <- sd(x) / sqrt(length(x))
  return(se)
}


# Standard Error of Mean by Group Function
mean_sem <- function(data, x, group) {
  result <- data %>%
    group_by(.data[[group]]) %>%
    summarise(mean_se(.data[[x]]))
  
  print(result)
}

# Standard Error of Median by Group Function
msem_group <- function(data, x, group) {
  result <- data %>%
    group_by(.data[[group]]) %>%
    summarise(1.2533 * mean_se(.data[[x]]))
  
  print(result)
}


# All 1hr and 2hr
shapiro.test(rpi$add_IFIV)
shapiro.test(rpi$Jitter)

rpi %>% 
  summarize(
    mean(add_IFIV),
    mean(Jitter),
    std.error(add_IFIV),
    std.error(Jitter)
  )






# By Model (PASSES BOTH, USE T.TEST AND MEAN/SEM)
# Fidelity
rpi_model %>% group_by(pi_model) %>% 
  shapiro_test(add_IFIV)
rpi_model %>% group_by(pi_model) %>%
  shapiro_test(Jitter)

levene_test(rpi_model, add_IFIV ~ pi_model)
levene_test(rpi_model, Jitter ~ pi_model)

rpi_model %>% group_by(pi_model) %>%
  summarize(
    mean(add_IFIV),
    mean(Jitter),
    std.error(add_IFIV),
    std.error(Jitter)
  )

# FR Metrics
rpi_model %>% group_by(pi_model) %>% 
  shapiro_test(SSIM)
rpi_model %>% group_by(pi_model) %>%
  shapiro_test(PSNR)
rpi_model %>% group_by(pi_model) %>% 
  shapiro_test(VMAF)
levene_test(rpi_model, SSIM ~ pi_model)
levene_test(rpi_model, PSNR ~ pi_model)
levene_test(rpi_model, VMAF ~ pi_model)

# Throughput
rpi_model %>% group_by(pi_model) %>% 
  shapiro_test(convert_secs)
rpi_model %>% group_by(pi_model) %>%
  shapiro_test(trans_secs)
rpi_model %>% group_by(pi_model) %>% 
  shapiro_test(process_secs)
levene_test(rpi_model, convert_secs ~ pi_model)
levene_test(rpi_model, trans_secs ~ pi_model)
levene_test(rpi_model, process_secs ~ pi_model)







##### BY MODEL #####
# add_IFIV 
model_add_ifiv_t = t_test(rpi_model, add_IFIV ~ pi_model)
print(model_add_ifiv_t)
model_add_ifiv = as.data.frame(model_add_ifiv_t) %>%
  mutate(p.signif = ifelse(p < 0.001, "***", ifelse(p < 0.01, "**", ifelse(p < 0.05, "*", ""))))

## Plot
model_add_ifiv_box = ggplot(rpi_model, aes(x = pi_model, y = add_IFIV, color = pi_model)) + 
  geom_boxplot(size=0.75, show.legend = FALSE) +
  theme_classic() +
  labs(subtitle = "Inter-Frame Interval Variability") +
  theme(legend.position = 'none',
        axis.title.x = element_blank()) +
  geom_jitter(size = 2, position=position_jitter(0.08)) +
  xlab("Raspberry Pi Model") + 
  ylab("IFIV (Secs)") +
  scale_color_manual(values = c("forestgreen", "tan")) +
  coord_cartesian(ylim = c(0.033366, 0.0333725)) +
  stat_pvalue_manual(model_add_ifiv, label = "p.signif", y.position = 0.03337175, size = 6.25)
print(model_add_ifiv_box)
ggsave(filename = "model_add_ifiv_box.jpeg", plot = model_add_ifiv_box, height = 4, width = 6, units = "in")


# Jitter
model_jit_t = t_test(rpi_model, Jitter ~ pi_model)
print(model_jit_t)
model_jit = as.data.frame(model_jit_t) %>%
  mutate(p.signif = ifelse(p < 0.001, "***", ifelse(p < 0.01, "**", ifelse(p < 0.05, "*", ""))))

## Plot
model_jit_box = ggplot(rpi_model, aes(x = pi_model, y = Jitter, color = pi_model)) +
  geom_boxplot(size=0.75) +
  theme_classic() +
  labs(subtitle = "Jitter") +
  theme(axis.title.x = element_blank()) +
  geom_jitter(size = 2, position=position_jitter(0.08)) +
  xlab("Raspberry Pi Model") + 
  ylab("Jitter %") +
  theme(legend.position = c(0.85,0.75))+
  scale_color_manual(values = c("forestgreen", "tan")) +
  stat_pvalue_manual(model_jit, label = "p.signif", y.position = 0.1175, size = 6.25)
print(model_jit_box)
ggsave(filename = "model_jit_box.jpeg", plot = model_jit_box, height = 4, width = 6, units = "in")


jitifiv = grid.arrange(model_add_ifiv_box, model_jit_box, ncol=2)
ggsave(filename = "jitifiv_plot.png", plot=jitifiv, height = 4, width = 6, units = "in")


# Conv Secs
# convert_secs
model_conv_wil = wilcox_test(rpi_model, convert_secs ~ pi_model)
print(model_conv_wil)
model_conv = as.data.frame(model_conv_wil) %>%
  mutate(p.signif = ifelse(p < 0.001, "***", ifelse(p < 0.01, "**", ifelse(p < 0.05, "*", ""))))
wilcox_effsize(rpi_model, convert_secs ~ pi_model)
msem_group(rpi, "convert_secs", "pi_model")

## Plot
model_conv_box = ggplot(rpi_model, aes(x = pi_model, y = convert_secs, color = pi_model)) + 
  geom_boxplot(size=0.75, show.legend = FALSE) +
  theme_classic() +
  labs(subtitle = "Conversion Time") +
  geom_jitter(size = 2, position=position_jitter(0.08), show.legend = FALSE) +
  theme(axis.title.x = element_blank()) +
  ylab("Time in Seconds") +
  scale_color_manual(values = c("forestgreen", "tan")) +
  coord_cartesian(ylim = c(0,140)) +
  stat_pvalue_manual(model_conv, label = "p.signif", y.position = 135, size = 6.25)
print(model_conv_box)


# Trans Secs
model_trans_wil = wilcox_test(rpi_model, trans_secs ~ pi_model)
print(model_trans_wil)
model_trans = as.data.frame(model_trans_wil) %>%
  mutate(p.signif = ifelse(p < 0.001, "***", ifelse(p < 0.01, "**", ifelse(p < 0.05, "*", ""))))
wilcox_effsize(rpi_model, trans_secs ~ pi_model)
msem_group(rpi, "trans_secs", "pi_model")

## Plot
model_trans_box = ggplot(rpi_model, aes(x = pi_model, y = trans_secs, color = pi_model)) + 
  geom_boxplot(size=0.75) +
  theme_classic() +
  labs(subtitle = "Transfer Time") +
  geom_jitter(size = 2, position=position_jitter(0.08)) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = c(0.8,0.9))+
  theme(axis.title.y = element_blank()) +
  scale_color_manual(values = c("forestgreen", "tan")) +
  coord_cartesian(ylim = c(0,135)) +
  stat_pvalue_manual(model_trans, label = "p.signif", y.position = 70, size = 6.25)
print(model_trans_box)




# Model Throughput Graph
tpm = grid.arrange(model_conv_box, model_trans_box, ncol=2)
ggsave(filename = "tpm_plot.png", plot=tpm, height = 4, width = 6, units = "in")









##### BY TIME #####


## 24hr Time (FAILES LEVENE, PASSES SHAPIRO, USE WILCOX AND MEAN/SEM)
# Fidelity
rpi_all %>% group_by(time) %>% 
  shapiro_test(add_IFIV)
rpi_all %>% group_by(time) %>%
  shapiro_test(Jitter)

levene_test(rpi_all, add_IFIV ~ time)
levene_test(rpi_all, Jitter ~ time)

rpi_all %>% group_by(time) %>% 
  summarize(
    mean(add_IFIV),
    mean(Jitter),
    std.error(add_IFIV),
    std.error(Jitter)
  )

# FR Metrics (FAIL Shapiro, PASS Levene except PSNR, use Kruskal-Wallis for all)
rpi_all %>% group_by(time) %>% 
  shapiro_test(SSIM)
rpi_all %>% group_by(time) %>%
  shapiro_test(PSNR)
rpi_all %>% group_by(time) %>% 
  shapiro_test(VMAF)
levene_test(rpi_all, SSIM ~ time)
levene_test(rpi_all, PSNR ~ time)
levene_test(rpi_all, VMAF ~ time)

rpi_all %>% group_by(time) %>% 
  summarize(
    median(SSIM),
    median(PSNR),
    median(VMAF),
    (std.error(SSIM) * 1.2533),
    (std.error(PSNR) * 1.2533),
    (std.error(VMAF) * 1.2533)
  )



# add_IFIV 
time_add_IFIV_krusk = kruskal_test(rpi_all, add_IFIV ~ time)
print(time_add_IFIV_krusk)
time_add_IFIV_dunn = dunn_test(rpi_all, add_IFIV ~ time)
print(time_add_IFIV_dunn)

# Plot
time_add_IFIV_box = ggplot(rpi_all, aes(x = time, y = add_IFIV, color = time)) + 
  geom_boxplot(size=0.75) +
  theme_classic() +
  labs(subtitle = "Inter-Frame Interval Variability") +
  geom_jitter(size = 2, position=position_jitter(0.08)) +
  xlab("Time") + 
  ylab("Inter-Frame Interval Variability (IFIV)") +
  scale_color_manual(values = sess_colors) +
  stat_pvalue_manual(time_add_IFIV_dunn, label = "p.adj.signif", y.position = c(0.033372,0.0333725), size = 6.5, hide.ns = TRUE)
print(time_add_IFIV_box)
ggsave(filename = "time_add_IFIV_box.jpeg", plot = time_add_IFIV_box, height = 4, width = 6, units = "in")



# Jitter
time_jitter_krusk = kruskal_test(rpi_all, Jitter ~ time)
print(time_jitter_krusk)
time_jitter_dunn = dunn_test(rpi_all, Jitter ~ time)
print(time_jitter_dunn)

# Plot
time_jitter_box = ggplot(rpi_all, aes(x = time, y = Jitter, color = time)) + 
  geom_boxplot(size=0.75, show.legend = FALSE) +
  theme_classic() +
  labs(subtitle = "Percent of Jitter") +
  geom_jitter(size = 2, position=position_jitter(0.08), show.legend = FALSE) +
  xlab("Time") + 
  ylab("Jitter%") +
  scale_color_manual(values = sess_colors) +
  coord_cartesian(ylim = c(0.1, 0.117)) +
  stat_pvalue_manual(time_jitter_dunn, label = "p.adj.signif", y.position = c(0.115,0.11625), size = 6.5, hide.ns = TRUE)
print(time_jitter_box)
ggsave(filename = "time_jitter_box.jpeg", plot = time_jitter_box, height = 4, width = 6, units = "in")


# Fidelity Graph
leg = get_legend(time_add_IFIV_box)
layout_matrix <- rbind(c(1, 1, 1, 2, 2, 2, 3))

ftb = grid.arrange(time_jitter_box, time_add_IFIV_box + theme(legend.position = "none"), leg, layout_matrix = layout_matrix)
print(ftb)
ggsave(filename = "ftb_plot.png", plot=ftb, height = 4, width = 6, units = "in")



# SSIM
time_ssim_krusk = kruskal_test(rpi_all, SSIM ~ time)
print(time_ssim_krusk)


# PSNR
time_psnr_krusk = kruskal_test(rpi_all, PSNR ~ time)
print(time_psnr_krusk)
time_psnr_dunn = dunn_test(rpi_all, PSNR ~ time)
print(time_psnr_dunn)

# Plot
time_psnr_box = ggplot(rpi_all, aes(x = time, y = PSNR, color = time)) + 
  geom_boxplot(size=0.75) +
  theme_classic() +
  geom_jitter(size = 2, position=position_jitter(0.08)) +
  xlab("Time") + 
  ylab("Peak Signal-to-Noise Ratio (PSNR)") +
  scale_color_manual(values = sess_colors) +
  coord_cartesian(ylim = c(35,52)) +
  stat_pvalue_manual(time_psnr_dunn, label = "p.adj.signif", y.position = c(50,51.5), size = 6.5, hide.ns = TRUE)
print(time_psnr_box)
ggsave(filename = "time_psnr_box.jpeg", plot = time_psnr_box, height = 4, width = 6, units = "in")


# VMAF
time_vmaf_krusk = kruskal_test(rpi_all, VMAF ~ time)
print(time_vmaf_krusk)


vid24hr = round(((71.8/9) + (78.5/10))/2,2)
print(vid24hr)
MB24hr = round(((((71.8/9) + (78.5/10))/2)/24)*1000,0)
print(MB24hr)
