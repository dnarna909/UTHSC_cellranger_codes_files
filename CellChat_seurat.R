#' https://htmlpreview.github.io/?https://github.com/sqjin/CellChat/blob/master/tutorial/CellChat-vignette.html

# Load the required libraries -------------------------------------------------------------------------------
library(CellChat)
library(patchwork)
options(stringsAsFactors = FALSE)

# Part I: Data input & processing and initialization of CellChat object --------------------------------------

## Load data ------------------------------------------------------------------------------------------------

load("/Users/niej/Documents/CellChat/tutorial/data_humanSkin_CellChat.rda")
data.input = data_humanSkin$data # normalized data matrix
meta = data_humanSkin$meta # a dataframe with rownames containing cell meta data
cell.use = rownames(meta)[meta$condition == "LS"] # extract the cell names from disease data

# Prepare input data for CelChat analysis
data.input = data.input[, cell.use]
meta = meta[cell.use, ]
# meta = data.frame(labels = meta$labels[cell.use], row.names = colnames(data.input)) # manually create a dataframe consisting of the cell labels
unique(meta$labels) # check the cell labels

## Create a CellChat object --------------------------------------------
cellchat <- createCellChat(object = data.input, meta = meta, group.by = "labels")

## Add cell information into meta slot of the object (Optional) -------------------------------------------------
#' If cell mata information is not added when creating CellChat object, USERS can also add it later 
#' using addMeta, and set the default cell identities using setIdent.
cellchat <- addMeta(cellchat, meta = meta)
cellchat <- setIdent(cellchat, ident.use = "labels") # set "labels" as default cell identity
levels(cellchat@idents) # show factor levels of the cell labels
groupSize <- as.numeric(table(cellchat@idents)) # number of cells in each cell group

## Set the ligand-receptor interaction database -------------------------------------------------------------
CellChatDB <- CellChatDB.human # use CellChatDB.mouse if running on mouse data
showDatabaseCategory(CellChatDB)

# Show the structure of the database
dplyr::glimpse(CellChatDB$interaction)

# use a subset of CellChatDB for cell-cell communication analysis
CellChatDB.use <- subsetDB(CellChatDB, search = "Secreted Signaling") # use Secreted Signaling
# use all CellChatDB for cell-cell communication analysis
# CellChatDB.use <- CellChatDB # simply use the default CellChatDB

# set the used database in the object
cellchat@DB <- CellChatDB.use

## Pre-processing the expression data for cell-cell communication analysis ---------------------------------------------
# subset the expression data of signaling genes for saving computation cost
cellchat <- subsetData(cellchat) # This step is necessary even if using the whole database
future::plan("multiprocess", workers = 4) # do parallel
cellchat <- identifyOverExpressedGenes(cellchat)
cellchat <- identifyOverExpressedInteractions(cellchat)

# project gene expression data onto PPI (Optional: when running it, USER should set `raw.use = FALSE` in the function `computeCommunProb()` in order to use the projected data)
# cellchat <- projectData(cellchat, PPI.human)


# Part II: Inference of cell-cell communication network --------------------------------------------------------
## Compute the communication probability and infer cellular communication network -------------------------------------
cellchat <- computeCommunProb(cellchat)
# Filter out the cell-cell communication if there are only few number of cells in certain cell groups
cellchat <- filterCommunication(cellchat, min.cells = 10)

## Extract the inferred cellular communication network as a data frame -------------------------------------------------
## Infer the cell-cell communication at a signaling pathway level ----------------------------------------------------------
cellchat <- computeCommunProbPathway(cellchat)

## Calculate the aggregated cell-cell communication network ----------------------------------------------------------------
cellchat <- aggregateNet(cellchat)

groupSize <- as.numeric(table(cellchat@idents))
par(mfrow = c(1,2), xpd=TRUE)
netVisual_circle(cellchat@net$count, vertex.weight = groupSize, weight.scale = T, label.edge= F, title.name = "Number of interactions")
netVisual_circle(cellchat@net$weight, vertex.weight = groupSize, weight.scale = T, label.edge= F, title.name = "Interaction weights/strength")

mat <- cellchat@net$weight
par(mfrow = c(3,4), xpd=TRUE)
for (i in 1:nrow(mat)) {
  mat2 <- matrix(0, nrow = nrow(mat), ncol = ncol(mat), dimnames = dimnames(mat))
  mat2[i, ] <- mat[i, ]
  netVisual_circle(mat2, vertex.weight = groupSize, weight.scale = T, edge.weight.max = max(mat), title.name = rownames(mat)[i])
}


# Part III: Visualization of cell-cell communication network -----------------------------------------------------------------
## Visualize each signaling pathway using Hierarchy plot, Circle plot or Chord diagram --------------------------------------
#' Here we take input of one signaling pathway as an example. All the signaling pathways showing significant communications 
#' can be accessed by cellchat@netP$pathways.

pathways.show <- c("CXCL") 
#' `Hierarchy plot`
# Here we define `vertex.receive` so that the left portion of the hierarchy plot shows signaling to fibroblast and the right portion shows signaling to immune cells 
vertex.receiver = seq(1,4) # a numeric vector. 
netVisual_aggregate(cellchat, signaling = pathways.show,  vertex.receiver = vertex.receiver)
# Circle plot
par(mfrow=c(1,1))
netVisual_aggregate(cellchat, signaling = pathways.show, layout = "circle")


#' `Chord diagram`
par(mfrow=c(1,1))
netVisual_aggregate(cellchat, signaling = pathways.show, layout = "chord")


#' `Heatmap`
par(mfrow=c(1,1))
netVisual_heatmap(cellchat, signaling = pathways.show, color.heatmap = "Reds")
#> Do heatmap based on a single object


#' For the chord diagram, CellChat has an independent function netVisual_chord_cell to flexibly visualize 
#' the signaling network by adjusting different parameters in the circlize package. For example, we can 
#' define a named char vector group to create multiple-group chord diagram, e.g., grouping cell 
#' clusters into different cell types.

#' `Chord diagram`
group.cellType <- c(rep("FIB", 4), rep("DC", 4), rep("TC", 4)) # grouping cell clusters into fibroblast, DC and TC cells
names(group.cellType) <- levels(cellchat@idents)
netVisual_chord_cell(cellchat, signaling = pathways.show, group = group.cellType, title.name = paste0(pathways.show, " signaling network"))
#> Plot the aggregated cell-cell communication network at the signaling pathway level


### Compute the contribution of each ligand-receptor pair to the overall signaling pathway and visualize cell-cell communication mediated by a single ligand-receptor pair -----------------------------------
netAnalysis_contribution(cellchat, signaling = pathways.show)


#' We can also visualize the cell-cell communication mediated by a single ligand-receptor pair. We provide a 
#' function extractEnrichedLR to extract all the significant interactions (L-R pairs) and related signaling 
#' genes for a given signaling pathway.

pairLR.CXCL <- extractEnrichedLR(cellchat, signaling = pathways.show, geneLR.return = FALSE)
LR.show <- pairLR.CXCL[1,] # show one ligand-receptor pair
# Hierarchy plot
vertex.receiver = seq(1,4) # a numeric vector
netVisual_individual(cellchat, signaling = pathways.show,  pairLR.use = LR.show, vertex.receiver = vertex.receiver)
#> [[1]]
# Circle plot
netVisual_individual(cellchat, signaling = pathways.show, pairLR.use = LR.show, layout = "circle")


#> [[1]]
# Chord diagram
netVisual_individual(cellchat, signaling = pathways.show, pairLR.use = LR.show, layout = "chord")


#> [[1]]

### Automatically save the plots of the all inferred network for quick exploration -----------------------------------
# Access all the signaling pathways showing significant communications
pathways.show.all <- cellchat@netP$pathways
# check the order of cell identity to set suitable vertex.receiver
levels(cellchat@idents)
vertex.receiver = seq(1,4)
for (i in 1:length(pathways.show.all)) {
  # Visualize communication network associated with both signaling pathway and individual L-R pairs
  netVisual(cellchat, signaling = pathways.show.all[i], vertex.receiver = vertex.receiver, layout = "hierarchy")
  # Compute and visualize the contribution of each ligand-receptor pair to the overall signaling pathway
  gg <- netAnalysis_contribution(cellchat, signaling = pathways.show.all[i])
  ggsave(filename=paste0(pathways.show.all[i], "_L-R_contribution.pdf"), plot=gg, width = 3, height = 2, units = 'in', dpi = 300)
}

## Visualize cell-cell communication mediated by multiple ligand-receptors or signaling pathways ----------------------------------
### Bubble plot --------------------------------------
#' We can also show all the significant interactions (L-R pairs) from some cell groups to other cell groups using netVisual_bubble.

# show all the significant interactions (L-R pairs) from some cell groups (defined by 'sources.use') to other cell groups (defined by 'targets.use')
netVisual_bubble(cellchat, sources.use = 4, targets.use = c(5:11), remove.isolate = FALSE)
#> Comparing communications on a single object


# show all the significant interactions (L-R pairs) associated with certain signaling pathways
netVisual_bubble(cellchat, sources.use = 4, targets.use = c(5:11), signaling = c("CCL","CXCL"), remove.isolate = FALSE)
#> Comparing communications on a single object


# show all the significant interactions (L-R pairs) based on user's input (defined by `pairLR.use`)
pairLR.use <- extractEnrichedLR(cellchat, signaling = c("CCL","CXCL","FGF"))
netVisual_bubble(cellchat, sources.use = c(3,4), targets.use = c(5:8), pairLR.use = pairLR.use, remove.isolate = TRUE)
#> Comparing communications on a single object


### Chord diagram ----------------------------------
#' Similar to Bubble plot, CellChat provides a function netVisual_chord_gene for drawing Chord diagram to
#' 
#' show all the interactions (L-R pairs or signaling pathways) from some cell groups to other cell groups. 
#' Two special cases: one is showing all the interactions sending from one cell groups and the other is showing 
#' all the interactions received by one cell group.
#' 
#' show the interactions inputted by USERS or certain signaling pathways defined by USERS

# show all the significant interactions (L-R pairs) from some cell groups (defined by 'sources.use') to other 
# cell groups (defined by 'targets.use')
# show all the interactions sending from Inflam.FIB
netVisual_chord_gene(cellchat, sources.use = 4, targets.use = c(5:11), lab.cex = 0.5,legend.pos.y = 30)


# show all the interactions received by Inflam.DC
netVisual_chord_gene(cellchat, sources.use = c(1,2,3,4), targets.use = 8, legend.pos.x = 15)


# show all the significant interactions (L-R pairs) associated with certain signaling pathways
netVisual_chord_gene(cellchat, sources.use = c(1,2,3,4), targets.use = c(5:11), signaling = c("CCL","CXCL"),legend.pos.x = 8)


# show all the significant signaling pathways from some cell groups (defined by 'sources.use') to other cell groups (defined by 'targets.use')
netVisual_chord_gene(cellchat, sources.use = c(1,2,3,4), targets.use = c(5:11), slot.name = "netP", legend.pos.x = 10)

#' NB: Please ignore the note when generating the plot such as "Note: The first link end is drawn out of sector 'MIF'.". 
#' If the gene names are overlapped, you can adjust the argument small.gap by decreasing the value.

## Plot the signaling gene expression distribution using violin/dot plot ---------------------------------------
#' We can plot the gene expression distribution of signaling genes related to L-R pairs or signaling pathway using 
#' a Seurat wrapper function plotGeneExpression.

plotGeneExpression(cellchat, signaling = "CXCL")
#> Registered S3 method overwritten by 'spatstat.geom':
#>   method     from
#>   print.boxx cli
#> Scale for 'y' is already present. Adding another scale for 'y', which will
#> replace the existing scale.
#> Scale for 'y' is already present. Adding another scale for 'y', which will
#> replace the existing scale.
#> Scale for 'y' is already present. Adding another scale for 'y', which will
#> replace the existing scale.

#' By default, plotGeneExpression only shows the expression of signaling genes related to the inferred 
#' significant communications. USERS can show the expression of all signaling genes related to one signaling pathway by

plotGeneExpression(cellchat, signaling = "CXCL", enriched.only = FALSE)
#' Alternatively, USERS can extract the signaling genes related to the inferred L-R pairs or signaling pathway 
#' using extractEnrichedLR, and then plot gene expression using Seurat package.

# Part IV: Systems analysis of cell-cell communication network --------------------------------------------------------------
#' To facilitate the interpretation of the complex intercellular communication networks, CellChat quantitively 
#' measures networks through methods abstracted from graph theory, pattern recognition and manifold learning.
#' 
#' It can determine major signaling sources and targets as well as mediators and influencers within a given 
#' signaling network using centrality measures from network analysis
#' 
#' It can predict key incoming and outgoing signals for specific cell types as well as coordinated responses 
#' among different cell types by leveraging pattern recognition approaches.
#' 
#' It can group signaling pathways by defining similarity measures and performing manifold learning from both 
#' functional and topological perspectives.
#' 
#' It can delineate conserved and context-specific signaling pathways by joint manifold learning of multiple networks.

## Identify signaling roles (e.g., dominant senders, receivers) of cell groups as well as the major contributing signaling ---------------
#' CellChat allows ready identification of dominant senders, receivers, mediators and influencers in the 
#' intercellular communication network by computing several network centrality measures for each cell group. 
#' Specifically, we used measures in weighted-directed networks, including out-degree, in-degree, flow betweenesss 
#' and information centrality, to respectively identify dominant senders, receivers, mediators and influencers for 
#' the intercellular communications. In a weighteddirected network with the weights as the computed communication 
#' probabilities, the outdegree, computed as the sum of communication probabilities of the outgoing signaling from 
#' a cell group, and the in-degree, computed as the sum of the communication probabilities of the incoming signaling 
#' to a cell group, can be used to identify the dominant cell senders and receivers of signaling networks, respectively. 
#' For the definition of flow betweenness and information centrality, please check our paper and related reference.

### Compute and visualize the network centrality scores ------------------------------------------
# Compute the network centrality scores
cellchat <- netAnalysis_computeCentrality(cellchat, slot.name = "netP") # the slot 'netP' means the inferred intercellular communication network of signaling pathways
# Visualize the computed centrality scores using heatmap, allowing ready identification of major signaling roles of cell groups
netAnalysis_signalingRole_network(cellchat, signaling = pathways.show, width = 8, height = 2.5, font.size = 10)


### Visualize the dominant senders (sources) and receivers (targets) in a 2D space -------------------------------------------
#' We also provide another intutive way to visualize the dominant senders (sources) and receivers (targets) 
#' in a 2D space using scatter plot.

# Signaling role analysis on the aggregated cell-cell communication network from all signaling pathways
gg1 <- netAnalysis_signalingRole_scatter(cellchat)
#> Signaling role analysis on the aggregated cell-cell communication network from all signaling pathways
# Signaling role analysis on the cell-cell communication networks of interest
gg2 <- netAnalysis_signalingRole_scatter(cellchat, signaling = c("CXCL", "CCL"))
#> Signaling role analysis on the cell-cell communication network from user's input
gg1 + gg2


### Identify signals contributing most to outgoing or incoming signaling of certain cell groups ------------------------------------
#' We can also answer the question on which signals contributing most to outgoing or incoming signaling of certain cell groups.

# Signaling role analysis on the aggregated cell-cell communication network from all signaling pathways
ht1 <- netAnalysis_signalingRole_heatmap(cellchat, pattern = "outgoing")
ht2 <- netAnalysis_signalingRole_heatmap(cellchat, pattern = "incoming")
ht1 + ht2


# Signaling role analysis on the cell-cell communication networks of interest
ht <- netAnalysis_signalingRole_heatmap(cellchat, signaling = c("CXCL", "CCL"))

## Identify global communication patterns to explore how multiple cell types and signaling pathways coordinate together --------------
#' In addition to exploring detailed communications for individual pathways, an important question is 
#' how multiple cell groups and signaling pathways coordinate to function. CellChat employs a pattern 
#' recognition method to identify the global communication patterns.
#' 
#' As the number of patterns increases, there might be redundant patterns, making it difficult to interpret 
#' the communication patterns. We chose five patterns as default. Generally, it is biologically meaningful 
#' with the number of patterns greater than 2. In addition, we also provide a function selectK to infer the 
#' number of patterns, which is based on two metrics that have been implemented in the NMF R package, including 
#' Cophenetic and Silhouette. Both metrics measure the stability for a particular number of patterns based on a 
#' hierarchical clustering of the consensus matrix. For a range of the number of patterns, a suitable number of 
#' patterns is the one at which Cophenetic and Silhouette values begin to drop suddenly.
#' 
### Identify and visualize outgoing communication pattern of secreting cells ---------------------------------------------------------
#' Outgoing patterns reveal how the sender cells (i.e. cells as signal source) coordinate with each other 
#' as well as how they coordinate with certain signaling pathways to drive communication.
#' 
#' To intuitively show the associations of latent patterns with cell groups and ligand-receptor pairs or 
#' signaling pathways, we used river (alluvial) plots. We first normalized each row of W and each column of H 
#' to be [0,1], and then set the elements in W and H to be zero if they are less than 0.5. Such thresholding 
#' allows to uncover the most enriched cell groups and signaling pathways associated with each inferred pattern, 
#' that is, each cell group or signaling pathway is associated with only one inferred pattern. These thresholded 
#' matrices W and H are used as inputs for creating alluvial plots.
#' 
#' To directly relate cell groups with their enriched signaling pathways, we set the elements in W and H to be 
#' zero if they are less than 1/R where R is the number of latent patterns. By using a less strict threshold, 
#' more enriched signaling pathways associated each cell group might be obtained. Using a contribution score of 
#' each cell group to each signaling pathway computed by multiplying W by H, we constructed a dot plot in which 
#' the dot size is proportion to the contribution score to show association between cell group and their enriched 
#' signaling pathways. USERS can also decrease the parameter cutoff to show more enriched signaling pathways 
#' associated each cell group.
#' 
#' Load required package for the communication pattern analysis

library(NMF)
#> Loading required package: pkgmaker
#> Loading required package: registry
#> Loading required package: rngtools
#> Loading required package: cluster
#> NMF - BioConductor layer [OK] | Shared memory capabilities [NO: bigmemory] | Cores 15/16
#>   To enable shared memory capabilities, try: install.extras('
#> NMF
#> ')
#> 
#> Attaching package: 'NMF'
#> The following objects are masked from 'package:igraph':
#> 
#>     algorithm, compare
library(ggalluvial)
#' Here we run selectK to infer the number of patterns.

selectK(cellchat, pattern = "outgoing")
#' Both Cophenetic and Silhouette values begin to drop suddenly when the number of outgoing patterns is 3.

nPatterns = 3
cellchat <- identifyCommunicationPatterns(cellchat, pattern = "outgoing", k = nPatterns)


# river plot
netAnalysis_river(cellchat, pattern = "outgoing")
#> Please make sure you have load `library(ggalluvial)` when running this function


# dot plot
netAnalysis_dot(cellchat, pattern = "outgoing")


### Identify and visualize incoming communication pattern of target cells -----------------------------------------------
#' Incoming patterns show how the target cells (i.e. cells as signal receivers) coordinate with each other 
#' as well as how they coordinate with certain signaling pathways to respond to incoming signals.

selectK(cellchat, pattern = "incoming")
# Cophenetic values begin to drop when the number of incoming patterns is 4.

nPatterns = 4
cellchat <- identifyCommunicationPatterns(cellchat, pattern = "incoming", k = nPatterns)


# river plot
netAnalysis_river(cellchat, pattern = "incoming")
#> Please make sure you have load `library(ggalluvial)` when running this function


# dot plot
netAnalysis_dot(cellchat, pattern = "incoming")


## Manifold and classification learning analysis of signaling networks -------------------------------------------------------
#' Further, CellChat is able to quantify the similarity between all significant signaling pathways 
#' and then group them based on their cellular communication network similarity. Grouping can be done 
#' either based on the functional or structural similarity.
#' 
#' Functional similarity: High degree of functional similarity indicates major senders and receivers 
#' are similar, and it can be interpreted as the two signaling pathways or two ligand-receptor pairs 
#' exhibit similar and/or redundant roles. The functional similarity analysis requires the same cell 
#' population composition between two datasets.
#' 
#' Structural similarity: A structural similarity was used to compare their signaling network structure, 
#' without considering the similarity of senders and receivers.
#'

### Identify signaling groups based on their functional similarity ----------------------------------------------------------
cellchat <- computeNetSimilarity(cellchat, type = "functional")
cellchat <- netEmbedding(cellchat, type = "functional")
#> Manifold learning of the signaling networks for a single dataset
cellchat <- netClustering(cellchat, type = "functional")
#> Classification learning of the signaling networks for a single dataset
# Visualization in 2D-space
netVisual_embedding(cellchat, type = "functional", label.size = 3.5)


# netVisual_embeddingZoomIn(cellchat, type = "functional", nCol = 2)

### Identify signaling groups based on structure similarity ----------------------------------------------------------------
cellchat <- computeNetSimilarity(cellchat, type = "structural")
cellchat <- netEmbedding(cellchat, type = "structural")
#> Manifold learning of the signaling networks for a single dataset
cellchat <- netClustering(cellchat, type = "structural")
#> Classification learning of the signaling networks for a single dataset
# Visualization in 2D-space
netVisual_embedding(cellchat, type = "structural", label.size = 3.5)


netVisual_embeddingZoomIn(cellchat, type = "structural", nCol = 2)


# Part V: Save the CellChat object --------------------------------------------------------------------------------------
saveRDS(cellchat, file = "cellchat_humanSkin_LS.rds")
sessionInfo()
