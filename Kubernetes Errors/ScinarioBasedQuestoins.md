
1> Resource Sharing Challenge:->
  >>
>  >No rsource quota means unessesary memory leaks
>  >Creating multiple Namespaces and allocating them the Resource quota
>  >Using Resource Quota we can set the limit for the namespace
>  >Ask the dev team to do performence benchmarking and allocate the Resource Quota to the Namespaces acoordingly
>  >Now using Reource limits on the pod level the leakage of memory issue can be solved we will only see the error
>  >for the particular pod if it is leaking memory
>  >Share the thread dumps and heap dumps with the dev team and create jira tickit for it so the dev team will
>  >check the applicaiton for the issue and reslove it accordingly so it will not take more memory than necessary

1>Create Resource quotas according to Namespaces in kubernetes


