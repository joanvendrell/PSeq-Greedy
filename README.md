# PrSeq-Greedy
Probabilistic Sequential Greedy algorithm for optimizing distributed submodular maximization tasks under reliability constraints between agents.

See an example of its performance below over a distributed monitoring task where *n* UAVs must coordinate where they are placed to maximize 
coverage on the area. When probabilistic communication is applied, the overlapping between UAVs decsion increase decreasing the performance.

<img width="754" alt="perf_comm" src="https://github.com/user-attachments/assets/3ddf9bff-84a4-44b7-a02c-8ef4f5014c62">
<img width="748" alt="prob_comm" src="https://github.com/user-attachments/assets/6c52883a-12a9-4784-9f9e-fefc808192bd">

If you find PrSeq-Greedy useful for your work, we kindly request that you cite the following [publication](https://arxiv.org/abs/2409.09979) :

```
@article{vendrell2024optimality,
  title={Optimality Gap of Decentralized Submodular Maximization under Probabilistic Communication},
  author={Vendrell, Joan and Kia, Solmaz},
  journal={arXiv preprint arXiv:2409.09979},
  year={2024}
}
```
