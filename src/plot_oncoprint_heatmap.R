alter_fun <- list(
  # background = NULL,
  background = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"),
              gp = gpar(fill = "grey90", col = "grey90"))
  },
  # big blue
  DEL = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["DEL"], col = NA))
  },
  # big red
  AMP = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["AMP"], col = NA))
  },
  # small green
  MUT = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["MUT"], col = NA))
  },
  # small green
  SNP = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["SNP"], col = NA))
  },
  # small green
  INS = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["INS"], col = NA))
  },
  # small green
  ONP = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["ONP"], col = NA))
  },
  # small green
  DNP = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["DNP"], col = NA))
  },
  # small green
  HOMDEL = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["HOMDEL"], col = NA))
  },
  # medium purple
  Fusion = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["Fusion"], col = NA))
  },
  # small green
  Unknown = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["Unknown"], col = NA))
  },
  # small green
  Missense_Mutation = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["MUT"], col = NA))
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33,
              gp = gpar(fill = clrs$mutation["Missense_Mutation"], col = NA))
  },
  # small green
  Truncating_Mutation = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["MUT"], col = NA))
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["Truncating_Mutation"], col = NA))
  },
  # small green
  In_Frame_Mutation = function(x, y, w, h) {
    grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
              gp = gpar(fill = clrs$mutation["MUT"], col = NA))
    grid.rect(x, y, w-unit(0.5, "mm"), h*0.33, 
              gp = gpar(fill = clrs$mutation["In_Frame_Mutation"], col = NA))
  },
  # small white
  Germline = function(x, y, w, h) {
    grid.segments(x - w*0.5, y, x + w*0.5, y, gp = gpar(col = clrs$mutation["Germline"], lwd = 2))
  },
  # crossed lines
  Somatic = function(x, y, w, h) {
    grid.segments(x - w*0.4, y - h*0.4, x + w*0.4, y + h*0.4, gp = gpar(lwd = 2))
    grid.segments(x + w*0.4, y - h*0.4, x - w*0.4, y + h*0.4, gp = gpar(lwd = 2))
  }
)


heatmap_legend_alteration_param <- list(
  title = "Alterations",
  at = c("AMP","HOMDEL","MUT","Fusion"), 
  labels = c("Amplification","Deep deletion","Mutation","Fusion"),
  col_fun = clrs$mutation[c("AMP","HOMDEL","MUT","Fusion")]
)


heatmap_legend_mutation_type_param <- list(
  title = "Mutation type",
  at = c("Germline","Somatic","Missense_Mutation","Truncating_Mutation","In_Frame_Mutation"), 
  labels = c("Germline","Somatic","Missense","Truncating","Inframe"),
  col_fun = clrs$mutation[c("Germline","Somatic","Missense_Mutation","Truncating_Mutation","In_Frame_Mutation")], 
  lwd = c(2, 4, 4, 4, 4)
)


plot_oncoprint_heatmap <-
  function(mat,
           top_annotation,
           bottom_annotation,
           right_annotation,
           column_split) {
    column_title <- "MSK IMPACT"
    
    oncoprint_ht <- oncoPrint(
      mat,
      top_annotation = top_annotation,
      right_annotation = right_annotation,
      alter_fun = alter_fun,
      col = clrs$mutation,
      column_split = column_split,
      cluster_row_slices = FALSE,
      cluster_column_slices = FALSE,
      row_order = rownames(mat),
      show_row_names = TRUE,
      show_column_names = TRUE,
      remove_empty_rows = FALSE,
      remove_empty_columns = FALSE,
      row_names_side = "left",
      pct_gp = gpar(fontsize = 8), 
      pct_side = "right",
      row_names_gp = gpar(fontface = "italic", fontsize = 8),
      row_title_gp = gpar(fontsize = 0),
      column_title = "",
      column_title_gp = gpar(fontsize = 10),
      show_heatmap_legend = FALSE
    )
    
    oncoprint_ht
    
  }


plot_oncoprint_legend <-
  function(...) {
    
    lgd1 = Legend(at = heatmap_legend_alteration_param$at,
                  labels = heatmap_legend_alteration_param$labels,
                  title = heatmap_legend_alteration_param$title,
                  type = "grid",
                  legend_gp = gpar(fill = heatmap_legend_alteration_param$col_fun))
    lgd2 = Legend(at = heatmap_legend_mutation_type_param$at,
                  labels = heatmap_legend_mutation_type_param$labels,
                  title = heatmap_legend_mutation_type_param$title,
                  type = "lines", 
                  legend_gp = gpar(col = heatmap_legend_mutation_type_param$col_fun, 
                                   lwd = heatmap_legend_mutation_type_param$lwd), 
                  background = clrs$mutation["MUT"])
    
    oncoprint_lgd_list = packLegend(lgd1, lgd2, direction = "horizontal")
    
  }